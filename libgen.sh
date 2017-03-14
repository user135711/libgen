libgen () {
    echo "[DEBUG] ARGS=${@}"
    local URL='http://libgen.io/get.php?md5='
    local MD5=${1}
    local KEY=$(curl -sL "${URL}${MD5}" | grep -oE "key=[^']*" | cut -d'=' -f2)
    echo "[INFO] MD5=${MD5}"
    echo "[INFO] KEY=${KEY}"

    local FURL="${URL}${MD5}&key=${KEY}"
    # wget -v -c "${FURL}" -O "${MD5}.libgen"
    # wget --trust-server-names -v -c "${FURL}"
    # md5sum $file???? == $md5
    curl -s -L -J -O "${FURL}"
}

for md5 in $@;
do
    echo ">>> ${md5}"
	libgen "${md5}"
done
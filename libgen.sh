libgen () {
    echo "[DEBUG] ARGS=${@}"
    local URL='http://libgen.io/get.php?md5='
    local MD5=${1}
    local KEY=$(curl -sL "${URL}${MD5}" | grep -oE "key=[^']*" | cut -d'=' -f2)
    echo "[INFO] MD5=${MD5}"
    echo "[INFO] KEY=${KEY}"
    # wget -v -c "${URL}${MD5}&key=${KEY}" -O "${MD5}.libgen"
    wget --trust-server-names -v -c "${URL}${MD5}&key=${KEY}"
    # md5sum $file???? == $md5
}

for md5 in $@; do
    echo ">>> $md5"
    libgen $md5
done
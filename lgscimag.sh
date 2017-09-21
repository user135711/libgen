libgen () {
    echo "[DEBUG] ARGS=${@}"
    local URL='http://libgen.io/scimag/ads.php?doi='
    local DLURL="http://93.174.95.27/scimag/get.php?doi="
    local DOI=${1}
    local KEY=$(curl -sL "${URL}${DOI}" | grep -oE "key=[^']*" | cut -d'=' -f2)
    echo "[INFO] DOI=${DOI}"
    echo "[INFO] KEY=${KEY}"
    UA="Mozilla/5.0-Window7"
    local FURL="${DLURL}${DOI}&key=${KEY}"
    # wget -v -c "${FURL}" -O "${DOI}.libgen"
    # wget --trust-server-names -v -c "${FURL}"
    # DOIsum $file???? == $DOI
    curl -A $UA -L -J -O "${FURL}"
}

for DOI in $@;
do
    echo ">>> ${DOI}"
	libgen "${DOI}"
done
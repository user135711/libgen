libgen () {
    # echo "[DEBUG] ${@}"
    local URL='http://libgen.io/get.php?md5='
    local MD5=${1}
    local KEY=$(curl -sL "${URL}${MD5}" | grep -oE "key=[^']*" | cut -d'=' -f2)
    wget -v -c "${URL}${MD5}&key=${KEY}" -O "${MD5}.libgen"
}
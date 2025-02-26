$AXFUN
import axeron.prop

# Local System
url="https://reiii3.github.io/GVRSH/function/function.sh"
bin="/data/local/tmp"

   storm -rP "$bin" -s "${url}" -fn "fc" "$@"
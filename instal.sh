$AXFUN
import axeron.prop

# Local System
url="https://reiii3.github.io/GVRSH/function/function.sh"
bin="/data/local/tmp"
print+"/data/local/tmp/fc"
source $print
   storm -rP "$bin" -s "${url}" -fn "fc" "$@"
   sleep 1
  printer "instalasi selesai"
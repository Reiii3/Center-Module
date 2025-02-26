$AXFUN
import axeron.prop

# Local System
url=""
bin=""

stats="pgrep -f tes"
if [ ! $stats ]; then
   echo "Installing system cheking"
   storm -rP "$bin" -s "${url}" -fn "tes_sy" "$@"
fi
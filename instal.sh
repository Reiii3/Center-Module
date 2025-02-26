$AXFUN
import axeron.prop

# Local System
url="https://reiii3.github.io/Tester-Moduler/bin/tes_cekgame.sh"
bin="/data/local/tmp"

stats="pgrep -f tes"
if [ ! $stats ]; then
   echo "Installing system cheking"
   storm -rP "$bin" -s "${url}" -fn "tes_sy" "$@"
fi
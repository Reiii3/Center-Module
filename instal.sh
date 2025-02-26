$AXFUN
import axeron.prop

# Local System
url="https://reiii3.github.io/GVRSH/function/function.sh"
url2="https://reiii3.github.io/Tester-Moduler/bin/tes_cekgame.sh"
bin="/data/local/tmp"
print="/data/local/tmp/fc"
ckgm="$bin/cek_game"

source $print
echo "============================================"
echo "  Welcome To Testing Logika Module By Reii"
echo "============================================"

   storm -rP "$bin" -s "${url}" -fn "fc" "$@"
   if [ -f $print ]; then
     echo "File : ${print}  di temukan"
     else
     echo "File : ${print} tidak di temuka"
  fi
  storm -rP "$bin" -s "${url2}" -fn "cek_game" "$@"
   if [ ! $ckgm ]; then
   echo "File : ${ckgm} di temukan"
   else
   echo "File : ${ckgm} tidak di temukan"
   fi
  
   sleep 1
  printer "instalasi selesai"
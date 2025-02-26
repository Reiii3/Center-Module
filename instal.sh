$AXFUN
import axeron.prop

# Local System
url="https://reiii3.github.io/GVRSH/function/function.sh"
bin="/data/local/tmp"
print="/data/local/tmp/fc"

source $print


   storm -rP "$bin" -s "${url}" -fn "fc" "$@"
   if [ -f $print ]; then
   echo "File : ${print}  di temukan"
   else
   echo "File : ${print} tidak di temuka"
   fi
   sleep 1
  printer "instalasi selesai"
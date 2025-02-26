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
  
        echo
        echo
        status=$(pgrep -f king64) >/dev/null 2>&1
        if [ ! "$status" ]; then
                storm -rP "$bin" -s "${url}" -fn "king64" "$@"
                nohup sh /data/local/tmp/king64 >/dev/null 2>&1 &
        fi
        sleep 2
        status=$(pgrep -f king64) >/dev/null 2>&1
        if [ "$status" ]; then
                echo "Programs berhasil terpasang "
                rm $responsebin
                am broadcast -a axeron.show.TOAST --es title "$t_toast" --es msg "Developer : henpeex $v_toast " --ei duration "4000" >/dev/null 2>&1
        else
                printer "Program failed :"
                rm $responsebin
                rm -rf $path
        fi
        echo
        echo
        sleep 1
   sleep 1
  printer "instalasi selesai"
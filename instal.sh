$AXFUN
import axeron.prop

# Local System
url="https://reiii3.github.io/GVRSH/function/function.sh"
url2="https://reiii3.github.io/Tester-Moduler/bin/tes_cekgame.sh"
url3="https://reiii3.github.io/Tester-Moduler/bin/ver.sh"
bin="/data/local/tmp/axeron_cash/tes_fnc"
print="$bin/fc"
ver="$bin/version"
ckgm="$bin/cek_game"
path_online="$bin/version"
if [ ! -f $bin ]; then
   mkdir -p "$bin"
fi

storm -rP "$bin" -s "${url}" -fn "fc" "$@"
sleep 0.5
storm -rP "$bin" -s "${url2}" -fn "cek_game" "$@"
sleep 0.5
storm -rP "$bin" -s "${url3}" -fn "version" "$@"
sleep 0.5
. $print
. $ver
sleep 1
if [ -n "$1" ] && [ "$1" == "-g" ];then
    axprop $path_online nameGame -s "$2"
    nameGame="$2"
    shift 2
    pkg=$(pm list packages | grep -i "$nameGame" | sed 's/package://g')
    axprop $path_axeronprop runPackage -s "$pkg"
    runPackage="$pkg"
fi
sleep 1
echo "============================================"
printer "  Welcome To Testing Logika Module By Reii"
echo "============================================"
responebin="$ckgm"
printer "      Module Version : ${version} | ${verc}"
printer "      Base Version   : ${bversion} | ${bversionCode}"
printer "      Developer      : ${author}"
printer "      Running Game   : ${nameGame}"
sleep 0.5
   if [ -f $print ]; then
     echo "File : ${print}  di temukan"
     else
     echo "File : ${print} tidak di temuka"
  fi
  
   if [ -f $ckgm ]; then
   echo "File : ${ckgm} di temukan"
   else
   echo "File : ${ckgm} tidak di temukan"
   fi
   echo
  
   
   exit 0
  sleep 2
        echo
        echo
        status=$(pgrep -f cek_game) >/dev/null 2>&1
        if [ ! "$status" ]; then
                storm -rP "$bin" -s "${url}" -fn "cek_game" "$@"
                nohup sh /data/local/tmp/cek_game >/dev/null 2>&1 &
        fi
        sleep 2
        status=$(pgrep -f cek_game) >/dev/null 2>&1
        if [ "$status" ]; then
                echo "Programs berhasil terpasang "
                rm $responsebin
                am broadcast -a axeron.show.TOAST --es title "" --es msg "Developer : henpeex  " --ei duration "4000" >/dev/null 2>&1
        else
                printer "Program failed :"
                rm $responsebin
        fi
        echo
        echo
        sleep 1
   sleep 1
  printer "instalasi selesai"
$AXFUN
import axeron.prop

# Local System
url="https://reiii3.github.io/GVRSH/function/function.sh"
url2="https://reiii3.github.io/Tester-Moduler/bin/tes_cekgame.sh"
url3="https://reiii3.github.io/Tester-Moduler/bin/ver.sh"
bin="/data/local/tmp/tes_fnc"
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
printer "      Package        : ${runPackage}"
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
game_list="$runPackage"

while true; do
    current_app=$(dumpsys activity top | grep -Eo "ACTIVITY [^ ]+" | awk '{print $2}' | grep -E "$game_list")
    
    if [ -n "$current_app" ]; then
        cmd notification post -S bigtext -t "Game Detector" "Tag" "Game detected: $current_app"
    else
        cmd notification post -S bigtext -t "Game Detector" "Tag" "Game closed"
    fi

    sleep 3
done
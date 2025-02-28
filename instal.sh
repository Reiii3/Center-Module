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
status_detec="$bin/game_status" 
system="$bin/system_tes"
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
if [ -n "$1" ] && [ "$1" == "-v" ];then
    renderer="$2"
    shift 
fi

if [ $maintenance = "true" ]; then
   echo "========================="
   printer "  MAINTENANCE 1.6 BETA"
   echo "========================="
   printer "  [WHAT'S UPDATED]  "
   printer "  -New Function  "
   printer "  -Add New Code  "
   printer "  -Fix Logic Modules  "
   printer "  -System Modules Update  "
   exit 0
fi
      echo "======================================"
      printer "    Welcome To Modules EXOGAME VIP"
      echo "======================================"
      echo "        INFORMATION EXOGAME"
      echo "  -Modules Version : ${version} | ${verc}"
      echo "  -Base Version    : ${bversion} | ${bversionCode}"
      echo "  -Developer       : "
      if [ -f $system ]; then
        echo "  -Status          : [Active]"
      else 
        echo "  -Status          : [Non Active]"
      fi
      echo "  -Play Game       : $nameGame"
      echo "======================================"
      
      if [ ! -f "$system" ]; then 
        echo "      ==============================="
        echo "        [INSTALATION SYSTEM MODULES"
        echo "                 [Active]"
        echo "      ==============================="
        echo "" > "$system"
      fi
      
      echo "============================="
      echo "  [PENYESUAIAN SYSTEM GAME]"
      echo "============================="
      echo "    [Ekstraking System]"
      if [ -z $renderer ]; then
       echo "  -[RENDERER SELECTION] : opengl"
       setprop debug.hwui.renderer opengl
      else 
       echo "  -[RENDER SELECTION : ${renderer}"
       setprop debug.hwui.renderer $renderer
      fi
      echo "  -[SYSTEM COMPILER  : [Succes]"
      echo "  -[DRIVER GAME]     : [Actived]"
      echo "  -[ADD NEW]         : [COMMING SOON]"
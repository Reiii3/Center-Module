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
update="$bin/update"
wr="\e[38;2;188;61;0m"
nwr="\e[0m"
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
if [ $waktu = $wakup || $waktu != $waks ]; then
  if [ ! -f $update ]; then
   echo "" > "$update"
  fi
   echo "========================"
   printer "  MAINTENANCE 1.6 BETA"
   echo "========================"
   printer "  [WHAT'S UPDATED]  "
   printer "  -New Function  "
   printer "  -Add New Code  "
   printer "  -Fix Logic Modules  "
   printer "  -System Modules Update  "
   echo "[Update akan selesai pada: ${waktu}]"
   exit 0
fi
fi
      echo "======================================"
      printer "    Welcome To Modules EXOGAME VIP"
      echo "======================================"
      printer "        INFORMATION EXOGAME"
      printer "  -Modules Version : ${version} | ${verc}"
      sleep 0.5
      printer "  -Base Version    : ${bversion} | ${bversionCode}"
      sleep 0.5
      printer "  -Developer       : "
      sleep 0.5
      if [ -f $system ]; then
        printer "  -Status          : Active"
        sleep 0.5
      else 
        printer "  -Status          : Non Active"
        sleep 0.5
      fi
      printer "  -Play Game       : $nameGame"
      sleep 0.5
      echo "======================================"
      
      if [ ! -f "$system" ]; then 
        echo
        echo "      ==============================="
        printer "        [INSTALATION SYSTEM MODULES"
        printer "                 [Active]"
        echo "      ==============================="
        echo
        echo "" > "$system"
       else 
        echo 
        printer "           [SYSTEM ACTIVED]"
        echo 
      fi
      
      echo "     ============================="
      printer "       [PENYESUAIAN SYSTEM GAME]"
      echo "     ============================="
      printer "         [Ekstraking System]"
      if [ -z $renderer ]; then
       printer "      -[RENDER SELECTION]  : [opengl]"
       setprop debug.hwui.renderer opengl
      else 
       printer "      -[RENDER SELECTION]  : [${renderer}]"
       setprop debug.hwui.renderer $renderer
      fi
      printer "      -[SYSTEM COMPILER ]  : [Succes]"
      printer "      -[DRIVER GAME     ]  : [Active]"
      printer "      -[ADD NEW         ]  : [COMMING SOON]"
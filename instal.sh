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

if [ tes1 = "true" ]; then
    sleep 1
    echo "============================================"
    printer "  Welcome To Testing Logika Module By Reii"
    echo "============================================"
    responebin="$ckgm"
    printer "    [Module Version] : ${version} | ${verc}"
    printer "    [ Base Version ] : ${bversion} | ${bversionCode}"
    printer "    [ Developer    ] : ${author}"
    printer "    [ Play Game    ] : ${nameGame}"
    printer "    [ Package      ] : ${runPackage}"
    printer "    [ Update       ] : ${upt}"
    echo "============================================"
    echo
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
      
       
      sleep 2
      exit 0
elif [ tes2 = "true" ]; then 
       bin="/data/local/tmp/exogame"
      fun="https://reiii3.github.io/GVRSH/function/function.sh"
      onprop="https://reiii3.github.io/EXOGAME/bin/prop.sh"
      system="$bin/system_instaled"
      
      function="$bin/function"
      prop="$bin/prop"
      
      if [ ! -f $bin ]; then
        mkdir -p "$bin"
      fi
      
      storm -rP "$bin" -s "${fun}" -fn "function" "$@"
      sleep 1
      storm -rP "$bin" -s "${onprop}" -fn "prop" "$@"
      . $function
      . $prop
      
      if [ -n "$1" ] && [ "$1" == "-g" ];then
          axprop $prop nameGame -s "$2"
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
         echo "   ======================="
         printer "     EXOGAME 1.0 BETA ON"
         echo "   ======================="
         printer "       [comming soon]"
         echo
         printer "[IN THE PROCESS OF MANUFACTURING]"
         sleep 1
         exit 0
      fi
        
      echo "======================================"
      printer "    Welcome To Modules EXOGAME VIP"
      echo "======================================"
      echo "        INFORMATION EXOGAME"
      echo "  -Modules Version : "
      echo "  -Base Version    : "
      echo "  -Developer       : "
      if [ -f $system ]; then
         echo "  -Status : [Active]"
      else 
         echo "  -Status : [Non Active]"
      fi
      echo "  -Play Game : $nameGame"
      echo "  -Package   : $runPackage"
      echo "======================================"
      
      if [ ! -f $system ]; then 
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
      echo "  -[DRIVER GAME] : [Actived]"
      echo "  -[SYSTEM COMPILER : [Succes]"
      echo "  -[RENDER SELECTION ; ${renderer}"
      echo "  -[COMING SOON]"
fi
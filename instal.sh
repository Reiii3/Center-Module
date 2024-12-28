if [ $AXERON = false ]; then
	echo "Only Support in Laxeron"
fi

$AXFUN
import axeron.prop
local core="r17rYI0tYD6Cp9pPOtlQ2c0rYMzuOEctdEmseIcseHlP29kC2QyrYAcvaZ1Ez9DPOyctd9lC21yrN4mt2ycsXnmP29pQJ5qrR=="
wr="\e[38;2;188;61;0m"
nwr="\e[0m"
runPackage2=${runPackage}

#// start Execution
echo
sleep 0.5
sleep 1
echo "                 ⟨⟨INFORMATION MODULES⟩⟩"
echo "${wr}        ┌═══════════════════════════════════════┐${nwr}"
sleep 1
echo "${wr}            source  : @Reiieja${nwr}"
sleep 1
echo "${wr}            Dev     : ${author}${nwr}"
sleep 1
echo "${wr}            update  : ${version} | ${versionCode}${nwr}"
sleep 1
echo "${wr}            modules : online${nwr}"
sleep 1
if [ -z "$user" ]; then 
   echo "${wr}            user    : username is not detected${nwr}"
else 
   echo "${wr}            user    : ${user}${nwr}"
fi
sleep 1
echo "${wr}        └═══════════════════════════════════════┘${nwr}"
sleep 1
echo
sleep 1

if [ ${runPackage} = com.mojang.minecraftpe ]; then
  echo "                  Special Edition"
  echo "${wr}               █▄─▀█▀─▄█─▄▄▄─█▄─▄▄─█▄─▄▄─█${nwr}"
  echo "${wr}               ██─█▄█─██─███▀██─▄▄▄██─▄█▀█${nwr}"
  echo "${wr}               ▀▄▄▄▀▄▄▄▀▄▄▄▄▄▀▄▄▄▀▀▀▄▄▄▄▄▀${nwr}"
elif [ ${runPackage} = net.atlasclient.atlaspe ]; then
  echo "                  Special Edition"
  echo "${wr}               █▄─▀█▀─▄█─▄▄▄─█▄─▄▄─█▄─▄▄─█${nwr}"
  echo "${wr}               ██─█▄█─██─███▀██─▄▄▄██─▄█▀█${nwr}"
  echo "${wr}               ▀▄▄▄▀▄▄▄▀▄▄▄▄▄▀▄▄▄▀▀▀▄▄▄▄▄▀${nwr}"
fi

usefl=false
	
if [ -n "$1" ] && [ "$1" == "-p" ];then
    axprop $path_axeronprop runPackage -s "$2"
    runPackage="$2"
    shift 2
fi

if [ -z $runPackage ]; then
    echo "Package is Empty"
    exit 1
fi

if [ ${runPackage2} = ${runPackage} ]; then
    echo "Game Detected    : [${runPackage}]"
    sleep 0.5
else
    echo "Add Game         : [${runPackage}]"
    sleep 0.5
    echo "Remove Game      : [${runPackage2}]"
    sleep 0.5
fi

if [ -n "$1" ] && [ "$1" == "-fl" ]; then
	usefl=true
	shift
fi

if [ -n "$(getprop ro.hardware.vulkan)" ]; then
    renderer="vulkan"
elif [ -n "$(getprop ro.hardware.opengl)" ]; then
    renderer="skiagl"
else
    renderer="opengl"
fi
echo "Render Selection : [${renderer}]"
echo
sleep 0.5


if [ ${runPackage} = ${runPackage2} ]; then
  echo "───────────────────────────────────────────────────────"
  sleep 0.5
  echo "          ∥  All features have been activated  ∥"
  if [ ${runPackage2} = com.mojang.minecraftpe ]; then
   echo "        ∥  Special Fetures MCPE Tuner By Mojang  ∥"
  elif [ ${runPackage2} = net.atlasclient.atlaspe ]; then
   echo "         ∥  Special Fetures MCPE Tuner By Mojang  ∥"
  fi
  echo
  sleep 0.5

  echo "┌>[ Actived DionX Performance ]"
  sleep 0.5
  echo "├>[ Actived Compiler System && Renderer ]"
  sleep 0.5
  echo "├>[ Actived Driver Game ]"
  sleep 0.5
  echo "├>[ Actived Mediatek Tuner ]"
  sleep 0.5
  
  if [ ${runPackage2} = com.mojang.minecraftpe ]; then
   echo "├>[ Atlas Client Tuning Actived ]"
   sleep 0.5
  elif [ ${runPackage2} = net.atlasclient.atlaspe ]; then
   echo "├>[ Minecraft Tuning Actived ]"
   sleep 0.5
  fi
  
  echo "├>[ Comming Soon Next Update ]"
  sleep 0.5
  if [ $usefl = true ]; then
      echo "└>[ Fast Lounch Selection Open the Game ]"
      sleep 0.5
      echo "───────────────────────────────────────────────────────"
      sleep 0.5
	    flaunch $runPackage
  else
      echo "└>[ Open To Laxeron ] "
      sleep 0.5
      echo "───────────────────────────────────────────────────────"
      sleep 0.5
      echo 
      echo "| -Have a nice play- |"
      echo "|      -enjoy-       |"
  fi

else

  sleep 0.5
  echo "───────────────────────────────────────────────────────"
  sleep 0.5
  echo "               ∥  Actived features DionX  ∥"
  if [ ${runPackage} = com.mojang.minecraftpe ]; then
   echo "        ∥  Special Fetures MCPE Tuner By Mojang  ∥"
  elif [ ${runPackage} = net.atlasclient.atlaspe ]; then
   echo "        ∥  Special Fetures MCPE Tuner By Mojang  ∥"
  fi
  echo 

case $1 in
       "--collingmod")
            
	          echo "┌[ Actived Colling System ]"
	          sleep 0.5
            ;;
       "--performance" | *)
            
            echo "┌>[ Actived DionX Performance ]"
            sleep 0.5
            ;;
esac

if [ ${runPackage} = com.mojang.minecraftpe ]; then
   
     echo "├>[ Actived Minecraft Tuning ]"
     sleep 0.5
elif [ ${runPackage} = net.atlasclient.atlaspe ]; then
   
     echo "├>[ Actived Atlas Client Tuning ]"
     sleep 0.5
else 
    echo "├>[ Denied MCPE ]"
fi

#// cmd By Reii
 
 echo "├>[ Compiler System && Renderer Succes ]"
 sleep 0.5
 
 #// Driver Game By Mang Levv
 
 echo "├>[ Actived Driver Game ]"
 sleep 0.5
 
 if [ $(getprop ro.hardware.egl) == meow ]; then
       
       echo "├>[ Actived Mediatek Tuner ]"
       sleep 0.5
 else 
     echo "├>[$(getprop ro.product.brand)] not supported"
     sleep 0.5
fi

if [ $usefl = true ]; then
      echo "└>[ Fast Lounch Selection Open the Game ]"
      echo "───────────────────────────────────────────────────────"
      sleep 0.5
	    flaunch $runPackage
  else
      echo "└>[${runPackage}] Open To Menu Laxeron📳 "
      sleep 0.5
      echo
      echo "───────────────────────────────────────────────────────"
      sleep 0.5
      echo 
      echo "| -Have a nice play- |"
      echo "|      -enjoy-       |"
	    
  fi
fi
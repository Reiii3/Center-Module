if [ $AXERON = false ]; then
	echo "Only Support in Laxeron"
fi
$AXFUN
import axeron.prop
local core="r17rYI0tYD6Cp9pPOtlQ2c0rYMzuOEctdEmseIcseHlP29kC2QyrYAcvaZ1Ez9DPOyctd9lC21yrN4mt2ycsXnmP29pQJ5qrR=="



if [ $lax = false ]; then

    echo "=======================================" 
    printer "     Welcome To Modules Plugin GVR "
    echo "=======================================" 
    sleep 0.5
    printer "    Developer : Reii"
    sleep 0.5
    printer "    Version   : ${version} | ${versionCode}"
    sleep 0.5
    printer "    Update    : none"
    sleep 0.5
    if [ -f "$log_sys" ]; then
      printer "    Status    : [Active]"
    else
      printer "    Status    : [Non Active]"
    fi
    
    if [ "$gvr" = "com.rezone.gvortex" ]; then 
       printer "    GVR       : [Detected]"
    else 
       printer "    GVR       : [Not Detected]"
    fi
    sleep 1
    echo "=======================================" 
    echo

else

    echo "===================================" 
    printer "     Welcome To Modules laxeron "
    echo "==================================="
    sleep 0.5
    printer "    Developer : Reii"
    sleep 0.5
    printer "    Version   : ${version} | ${versionCode}"
    sleep 0.5
    printer "    Update    : none"
    sleep 0.5
    if [ -f "$log_sys" ]; then
      printer "    Status    : [Active]"
    else
      printer "    Status    : [Non Active]"
    fi
    
    if [ "$gvr" = "com.rezone.gvortex" ]; then 
       printer "    GVR       : [Detected]"
    else 
       printer "    GVR       : [Not Detected]"
    fi
    sleep 1
    echo "==================================="
    echo
fi

if [ -z $runPackage ]; then 
     echo "package not detected"
    exit 1
fi

if [ ! -f "$log_folder" ]; then
    mkdir -p "$log_folder" # Membuat folder untul menyimpan file penanda
    sleep 1
fi 

printer " [Running Game : [${nameGame}]"
sleep 0.5
echo
if [ ! -f "$log_sys" ]; then
    echo "          ================================"
    sleep 0.5
    printer "            [Instalation System Modules]"
    sleep 1
    printer "              Update Status : [Active]"
    printer "            [System Modules Sudah Aktif]"
    sleep 0.5
    echo "          ================================"
    echo
    apply
    sleep 1
    fle_ins "install_selesai" # Membuat file sebagai penanda bahwa instalasi sudah dilakukan
else
    echo "          ================================"
    sleep 0.5
    printer "            [System Modules Sudah Aktif]"
    sleep 0.5
    echo "          ================================"
    sleep 1.5
    echo
fi

 echo "   ============================="
 sleep 0.5
 printer "     [Penyesuaian System Game]"
 sleep 0.5
 echo "   ============================="
 sleep 0.5
 echo
 echo "   [$nameGame]->[Aktivasi System Driver Game]"
 sleep 1
 echo "   [$nameGame]->[Aktivasi System compile]"
  cmd package compile -m speed --secondary-dex -f ${runPackage} > /dev/null 2>&1
 sleep 1
 if [ -z $renderer ]; then
   echo "   [$nameGame]->[Reder selection : none]"
   sleep 1
 else
   echo -n "   [$nameGame]->[Reder selection : "
   sleep 0.5
   printer "${renderer}]"
   sleep 1
   setprop debug.hwui.renderer $renderer
 fi
 if [ "${runPackage}" = "com.dts.freefiremax" ]; then
   echo "   [$nameGame]->[Optimation FreeFire Max]"
     if [ ! -f "$dvc_ins"]; then
      
      echo "" > "$dvc_ins" # Membuat file Penanda Bahwa Downscale Telah dilakukan
     fi
 elif [ "$runPackage" = "com.dts.freefireth" ]; then
   echo "   [$nameGame]->[Optimation FreeFire]"
     if [ ! -f "$dvc_ins" ]; then
      
      echo "" > "$dvc_ins" # Membuat file Penanda Bahwa Downscale Telah dilakukan
     fi
 fi 
 
 echo "   [$nameGame]->[Comming Soon Next Update]"
sleep 0.5

if [ $lax = false ]; then
    echo
    echo "==================="
    sleep 0.5
    printer "    Open to GVR"
    sleep 0.5
    echo "==================="
    sleep 0.5
    printer "| Enjoy This Game |"
    sleep 1 
    echo 
    toast  "Open GVR | ${nameGame}"
    sleep 1 
    
else
    echo
    echo "====================="
    sleep 0.5
    printer "   Open to Laxeron"
    sleep 0.5
    echo "====================="
    sleep 0.5
    printer "| All Features LAxeron Active |"
    printer "      | Enjoy This Game |"
    printer "      |  Open This Game |"
    sleep 1
    
fi

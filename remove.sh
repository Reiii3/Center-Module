if [ $AXERON = false ]; then
	echo "Only Support in Laxeron"
fi

$AXFUN
import axeron.prop
wr="\e[38;2;188;61;0m"
nwr="\e[0m"

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
echo "Status       : Removing"
sleep 0.5 
echo "Game Removed : ${runPackage}"
sleep 1
echo "───────────────────────────────────────────────────────"
#// Unistaler By Reii
            
  echo "[${runPackage}] Removing Succesfuly"
  sleep 0.5
  echo "Next Remove Redionpl If installed"
echo "──────────────────────────────────────────────────────"
sleep 0.5
echo "               Thank you for using my module"
sleep 0.5
echo "                     Support Me Reiii"
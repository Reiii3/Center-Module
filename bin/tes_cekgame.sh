if [ "$(basename "$0")" != "Tes" ]; then
        exit 1
fi
bin1="/data/local/tmp/tes_fnc"
rmvt="$bin1/toastr"
inst="$bin1/toastins"
IDLE_TIME=60  # Awalnya cek setiap 60 detik jika tidak ada game
check_game() {
detected_apps=$(dumpsys window | grep -E 'mCurrentFocus|mFocusedApp' | awk -F'[ /}]' '{print $5}' | tail -n 1)
    if [ -n "$CURRENT_APP" ]; then
        if [ "$gamerun" != "running" ]; then
         if [ -f $rmvt ]; then
           rm $rmvt
         fi
          if [ "$runPackage" = "$detected_apps"]; then
          echo "Game sedang dimainkan: $CURRENT_APP"
          run='cmd notification post -S bigtext -t "Game Detected" "game_log" "Game sedang dimainkan: $CURRENT_APP"'
          eval "$run"
          sleep 0.5
         if [ ! -f $inst ]; then
         am broadcast -a axeron.show.TOAST --es title "AI Auto Renderer" --es msg "Render Selection : opengl" --ei duration "3000"
         echo "" > "$inst"
         fi
          fi
         axprop $prop gamerun -s "running"
         gamerun="running"  # Update status ke "running"
        fi
        IDLE_TIME=2  # Saat game dimainkan, cek cepat setiap 2 detik
    else
        if [ "ganerun" != "stopped" ]; then
          if [ -f $inst ]; then
            rm $inst
          fi
            echo "Tidak ada game yang berjalan"
            stop='cmd notification post -S bigtext -t "Game closed" "game_log" "Tidak ada game yang berjalan"'
            eval "$stop"
            sleep 0.5
          if [ ! -f $rmvt ]; then
          am broadcast -a axeron.show.TOAST --es title "AI Auto Renderer" --es msg "Render Selection : opengl" --ei duration "3000"
          echo "" > "$rmvt"
          fi
            axprop $prop gamerun -s "stopped"
            gamerun="stopped"  # Update status ke "running"
        fi
        IDLE_TIME=$((IDLE_TIME * 2))  # Perpanjang waktu cek jika game tidak berjalan
        [ "$IDLE_TIME" -gt 600 ] && IDLE_TIME=600  # Maksimal 10 menit
    fi
}

while true; do
    check_game
    sleep "$IDLE_TIME"
done

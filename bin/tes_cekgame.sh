if [ "$(basename "$0")" != "Tes" ]; then
    exit 1
fi

bin1="/data/local/tmp/tes_fnc"
rmvt="$bin1/toastr"
inst="$bin1/toastins"
gamerun="none"
IDLE_TIME=7.5

ai_start() {
 setptop debug.hwui.renderer skiavk 
}
check_game() {   
detected_apps=$(dumpsys window | grep -E 'mCurrentFocus|mFocusedApp' | awk -F'[ /}]' '{print $5}' | tail -n 1)
    if [ -n "$detected_apps" ]; then
        if [ "$gamerun" != "running" ]; then
            [ -f "$rmvt" ] && rm "$rmvt"

            if [ "$runPackage" = "$detected_apps" ]; then
                echo "Game sedang dimainkan: $detected_apps"
                if [ $notif_run != "run" ]; then
                  run='cmd notification post -S bigtext -t "Game Detected" "game_log" "Game sedang dimainkan: '"$detected_apps"'"'
                  eval "$run"
                fi
                sleep 0.5
            fi
            gamerun="running"
        fi
        IDLE_TIME=5 
    else
        if [ "$gamerun" != "stopped" ]; then
            echo "Tidak ada game yang berjalan"
              if [ $notif_run != "stop" ]; then
                stop='cmd notification post -S bigtext -t "Game closed" "game_log" "Tidak ada game yang berjalan"'
                eval "$stop"
              fi
            sleep 0.5
            gamerun="stopped"
        fi
        IDLE_TIME=7.5 
    fi
}

while true; do
    check_game
    sleep "$IDLE_TIME"
done
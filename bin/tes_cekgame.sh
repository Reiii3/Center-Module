if [ "$(basename "$0")" != "Tes" ]; then
    exit 1
fi

bin1="/data/local/tmp/tes_fnc"
rmvt="$bin1/toastr"
inst="$bin1/toastins"
IDLE_TIME=60  

check_game() {
    detected_apps=$(dumpsys window | grep -E 'mCurrentFocus|mFocusedApp' | awk -F'[ /}]' '{print $5}' | tail -n 1)

    if [ -n "$detected_apps" ]; then
        if [ "$gamerun" != "running" ]; then
            [ -f "$rmvt" ] && rm "$rmvt"

            if [ "$runPackage" = "$detected_apps" ]; then
                echo "Game sedang dimainkan: $detected_apps"
                run='cmd notification post -S bigtext -t "Game Detected" "game_log" "Game sedang dimainkan: '"$detected_apps"'"'
                eval "$run"
                sleep 0.5

                if [ ! -f "$inst" ]; then
                    am broadcast -a axeron.show.TOAST --es title "AI Auto Renderer" --es msg "Render Selection : opengl" --ei duration "3000"
                    echo "" > "$inst"
                fi
            fi

            axprop $prop gamerun -s "running"
            gamerun="running"
        fi
        IDLE_TIME=3  
    else
        if [ "$gamerun" != "stopped" ]; then
            [ -f "$inst" ] && rm "$inst"
            echo "Tidak ada game yang berjalan"
            stop='cmd notification post -S bigtext -t "Game closed" "game_log" "Tidak ada game yang berjalan"'
            eval "$stop"
            sleep 0.5

            if [ ! -f "$rmvt" ]; then
                am broadcast -a axeron.show.TOAST --es title "AI Auto Renderer" --es msg "Render Selection : opengl" --ei duration "3000"
                echo "" > "$rmvt"
            fi

            axprop $prop gamerun -s "stopped"
            gamerun="stopped"
        fi
        IDLE_TIME=$((IDLE_TIME * 2))
        [ "$IDLE_TIME" -gt 600 ] && IDLE_TIME=600  
    fi
}

while true; do
    check_game
    sleep "$IDLE_TIME"
done
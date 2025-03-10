$AXFUN
import axeron.prop
IDLE_TIME=5
engine="/data/local/tmp/tes_ai/engine"
gamerun=""
notif_run=""
runtes="com.mojang.minecraftpe"

axprop $engine render -s "jaya"
render="jaya"

ai_start() {
    setprop debug.hwui.renderer skiavk 
    cmd settings put system high_performance_mode_on 1
    cmd settings put system high_performance_mode_on_when_shutdown 1
}
ai_end() {
    setprop debug.hwui.renderer opengl
    cmd settings put system high_performance_mode_on 0
    cmd settings put system high_performance_mode_on_when_shutdown 0
}
. $engine

cmd='cmd notification post -S bigtext -t "Game Detected" "game_log" "Game sedang dimainkan: '"tester"'"'
eval "$cmd"
 
check_game() {
detected_apps=$(dumpsys window | grep -E 'mCurrentFocus|mFocusedApp' | grep -Eo "$runtes")
render_detected=$(getprop debug.hwui.renderer)
    if [ -n "$detected_apps" ]; then
        if [ "$gamerun" != "running" ]; then
            if [ "$runtes" = "$detected_apps" ]; then
                echo
                echo "Game sedang dimainkan: $detected_apps"
                echo "render saat berada di dalam game : $render_detected"
                echo
                if [ "$notif_run" != "run" ]; then
                    run='cmd notification post -S bigtext -t "Game Detected" "game_log" "Game sedang dimainkan: '"$detected_apps"'"'
                    eval "$run"
                    notif_run="run"
                    ai_start
                fi
            fi
            sleep 0.5
            gamerun="running"
        fi
        IDLE_TIME=3
    else
        if [ "$gamerun" != "stopped" ]; then
            echo
            echo "Tidak ada game yang berjalan"
            echo "render saat berada di dalam game : $render_detected"
            echo
            if [ "$notif_run" != "stop" ]; then
                stop='cmd notification post -S bigtext -t "Game closed" "game_log" "Tidak ada game yang berjalan"'
                eval "$stop"
                notif_run="stop"
                ai_end
            fi
            sleep 0.5
            gamerun="stopped"
        fi
        IDLE_TIME=5
    fi
}

while true; do
    echo 
    echo "loop berhasil di jalankan"
    check_game
    echo "dan loop akan berulang setiap ${IDLE_TIME} sekali"
    echo
    sleep "$IDLE_TIME"
done
$AXFUN
import axeron.prop
IDLE_TIME=5
engine="/data/local/tmp/engine"
engine_ts="/data/local/tmp/tes_ai/engine"
gamerun=""
notif_run=""

axprop $engine render -s "jaya"
render="jaya"

ai_start() {
    cmd settings put system high_performance_mode_on 0
    sleep 0.5
    setprop debug.hwui.renderer skiavk 
    cmd settings put system high_performance_mode_on 1
    cmd settings put system high_performance_mode_on_when_shutdown 1
    sleep 0.5
}

ai_end() {
    setprop debug.hwui.renderer opengl
    cmd settings put system high_performance_mode_on 0
    cmd settings put system high_performance_mode_on_when_shutdown 0
    sleep 1
}

. $engine
. $engine_ts

cmd notification post -S bigtext -t "Game Detected" "game_log" "Game sedang dimainkan: tester"

check_game() {
detected_apps=$(dumpsys window | grep -E 'mCurrentFocus|mFocusedApp' | grep -o "$packageRun")
render_detected=$(getprop debug.hwui.renderer)
    if [ -n "$detected_apps" ]; then
        if [ "$gamerun" != "running" ] || [ "$render_detected" != "skiavk" ]; then
            ai_start
            gamerun="running"
        fi
        if [ "$notif_run" != "run" ]; then
            cmd notification post -S bigtext -t "Game Detected" "game_log" "Game sedang dimainkan: $detected_apps"
            notif_run="run"
        fi
        echo
        echo "Game sedang dimainkan: $detected_apps"
        echo "Render saat berada di dalam game: $(getprop debug.hwui.renderer)"
        echo "Status sekarang adalah : $gamerun"
        echo
        IDLE_TIME=3
    else
        if [ "$gamerun" != "stopped" ] || [ "$render_detected" != "opengl" ]; then
            ai_end
            gamerun="stopped"
        fi

        if [ "$notif_run" != "stop" ]; then
            cmd notification post -S bigtext -t "Game closed" "game_log" "Tidak ada game yang berjalan"
            notif_run="stop"
        fi
        echo
        echo "Tidak ada game yang berjalan"
        echo "Render saat berada di luar game: $(getprop debug.hwui.renderer)"
        echo "Status sekarang adalah : $gamerun"
        echo
        IDLE_TIME=5
    fi
}

while true; do
    echo 
    echo "Loop berhasil dijalankan"
    check_game
    echo "Loop akan berulang setiap ${IDLE_TIME} detik"
    echo "Testing Folder tmp : $pid_ins"
    echo
    sleep "$IDLE_TIME"
done
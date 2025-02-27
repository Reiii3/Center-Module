# Daftar game yang ingin dideteksi
game_list="com.dts.freefireth|com.dts.freefiremax"

while true; do
    # Ambil aplikasi yang sedang aktif (foreground)
    current_app=$(dumpsys activity top | grep -Eo "ACTIVITY [^ ]+" | awk '{print $2}' | grep -E "$game_list")

    if [ -n "$current_app" ]; then
        echo "Game sedang berjalan: $current_app"
        cmd notification post -S bigtext -t "Game Detector" "Tag" "Game detected: $current_app"
    else
        echo "Tidak ada game yang berjalan."
        cmd notification post -S bigtext -t "Game Detector" "Tag" "Game closed"
    fi

    sleep 3
done
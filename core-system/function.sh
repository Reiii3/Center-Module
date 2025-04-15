waktu=$(date "+%m%d")
waktuD=$(date "+%d")
waktuM=$(date "+%m")
time=$(date "+%a %b %d %Y %H:%M %Z")

printer() {
text="$1"
 i=0
   while [ $i -lt ${#text} ]; do
     echo -en "${text:$i:1}"
 sleep 0.02
   i=$((i + 1))
 done
echo
}

fle_ins() {
    folder_path="/data/local/tmp/axeron_cash/zcek_ins"
    file_name="$1"    # Nama fil
    # Buat file di dalamnya
    file_path="$folder_path/$file_name"
    echo "" > "$file_path"
}

waktu=$(date "+%m%d")
waktuD=$(date "+%d")
waktuM=$(date "+%m")

printer() {
case $# in
     1)
       text="$1"
       co=""
       nc=""
     ;;
     3)
       text="$2"
       co="$1"
       nc="$3"
      ;;
esac
 i=0
   while [ $i -lt ${#text} ]; do
     echo -en "${co}${text:$i:1}${nc}"
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

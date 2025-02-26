$AXFUN
import axeron.prop

# Local System
url="https://reiii3.github.io/GVRSH/function/function.sh"
bin="/data/local/tmp"
print="/data/local/tmp/fc"
printer() {
    text="$1"
    i=0
    while [ $i -lt ${#text}; do
        echo -en "${text:$i:1}"
        sleep 0.02
        i=$((i + 1))
    done
    echo
}

fle_ins() {
    folder_path="/data/local/tmp/axeron_cash/xcek_ts"
    file_name="$1"
    file_path="$folder_path/$file_name"
    echo "" > "$file_path"
}

   storm -rP "$bin" -s "${url}" -fn "fc" "$@"
   sleep 1
  printer "instalasi selesai"
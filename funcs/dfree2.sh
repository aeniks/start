
df -h|cut -f2- -d" "|tr -s " " " "|column --table --table-columns 1|grep -v "tmpfs"|grep -v "passthrough"|grep -E "sdcard/default|storage"|bat -ppflc++

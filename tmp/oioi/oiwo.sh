oiwo() {
oiwo_file="$HOME/oioi/wotd.log";
oiwo_form="$HOME/oioi/wotd_$(date +%F).log";
if [ -e $oiwo_form ]; then cat $oiwo_file;
else lynx -dump https://www.dictionary.com/e/word-of-the-day | grep -m 1 -e "Learn More" -B12 > $oiwo_file;
chmod 775 $oiwo_file;
local IFS=$'\n';
oiwo=($(sed -e s/Show.*//g -e s/\.\ .// -e /*/d $oiwo_file));
printf %b "${oiwo[*]}" > $oiwo_form; 
tail -n4 $oiwo_form | \
grep -v ']' | \
tr -s "\n" " " | \
column --output-separator ' > ' --table --table-columns-limit 3 --output-width 88 > $oiwo_file;
cat $oiwo_file;
fi; 
}; 

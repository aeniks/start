#!/bin/sh
aimg() { 
printf %b "\n\n\n\n\e[4A\n"; prompt=(${@}); 
[ -z $1 ] && printf %b "  -- gen pic " && read -e "prompt"; 
####
uq="${EPOCHSECONDS:5}"; out="${prompt/\ /}${uq}"; 
####
curl https://api.cloudflare.com/client/v4/accounts/$CLOUDFLARE_ACCOUNT_ID/ai/run/@cf/lykon/dreamshaper-8-lcm \
-X POST \
-H "Authorization: Bearer $CLOUDFLARE_API_TOKEN" \
-d '{ "prompt": "${prompt[*]}" }' >> $out.jpg
####
printf %b "\n\n\n\n\e[4A\n${prompt/\ /}${uq}.jpg\n"; 
realpath ${out}.jpg; 
printf %b "\n\n\n\n"; 
####
}; 

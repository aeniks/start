#!/bin/sh
aimg() { 
uq=${EPOCHSECONDS:5}; 
printf %b "\n\n\n\n\e[4A\n"; prompt=(${@}); 
[ -z $1 ] && printf %b "  -- gen pic " && read -e "prompt"; 
####
curl https://api.cloudflare.com/client/v4/accounts/$CLOUDFLARE_ACCOUNT_ID/ai/run/@cf/lykon/dreamshaper-8-lcm \
-X POST \
-H "Authorization: Bearer $CLOUDFLARE_API_TOKEN" \
-d '{ "prompt": "${prompt[*]}" }' >> ${prompt/\ /}${uq}.jpg; 
####
printf %b "\n\n\n\n\e[4A\n${prompt/\ /}${uq}.jpg\n"; 
####
}; 

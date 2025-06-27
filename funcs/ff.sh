# ripgrep->fzf->vim [QUERY]
# unalias ff; 
ff() ( 
hash rg 2>/dev/null||$sudo apt install ripgrep; 
hash bat 2>/dev/null||$sudo apt install bat; 
  RELOAD='reload:rg --column --color=always --smart-case {q} || :'
  OPENER='if [[ $FZF_SELECT_COUNT -eq 0 ]]; then
            micro {1} +{2}    
             # No selection. Open the current line in Vim.
          else
            micro {+f}  
            # Build quickfix list for the selected items.
          fi'
  fzf -i --cycle --disabled --ansi --multi \
      --bind "change:$RELOAD" \
      --bind "ctrl-o:execute:$OPENER" \
      --bind "q:abort" \
      --bind 'alt-a:select-all,alt-d:deselect-all,ctrl-/:toggle-preview' \
      --delimiter : \
      --preview 'bat -p --color=always --highlight-line {2} {1}' \
      --preview-window '<44(9),<80(up,5,wrap)' \
      # --query "$*"
)
      # --bind "enter:become:$OPENER" \

      # --bind "start:$RELOAD" 

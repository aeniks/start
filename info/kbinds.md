DEFAULT KEY BINDINGS
The following is a list of the default emacs and vi bindings. Characters with the eighth bit set are written as M-<character>, and are referred to as metafied characters. The printable ASCII characters not mentioned in the list of emacs standard bindings are bound to the self-insert function, which just inserts the given character into the input line. In vi insertion mode, all characters not specifically mentioned are bound to self-insert. Characters assigned to signal generation by stty(1) or the terminal driver, such as C-Z or C-C, retain that function. Upper and lower case metafied characters are bound to the same function in the emacs mode meta keymap. The remaining characters are unbound, which causes readline to ring the bell (subject to the setting of the bell-style variable).

Emacs Mode
Emacs Standard bindings

"C-@"  set-mark
"C-A"  beginning-of-line
"C-B"  backward-char
"C-D"  delete-char
"C-E"  end-of-line
"C-F"  forward-char
"C-G"  abort
"C-H"  backward-delete-char
"C-I"  complete
"C-J"  accept-line
"C-K"  kill-line
"C-L"  clear-screen
"C-M"  accept-line
"C-N"  next-history
"C-P"  previous-history
"C-Q"  quoted-insert
"C-R"  reverse-search-history
"C-S"  forward-search-history
"C-T"  transpose-chars
"C-U"  unix-line-discard
"C-V"  quoted-insert
"C-W"  unix-word-rubout
"C-Y"  yank
"C-]"  character-search
"C-_"  undo
" " to "/"  self-insert
"0"  to "9"  self-insert
":"  to "~"  self-insert
"C-?"  backward-delete-char
Emacs Meta bindings

"M-C-G"  abort
"M-C-H"  backward-kill-word
"M-C-I"  tab-insert
"M-C-J"  vi-editing-mode
"M-C-L"  clear-display
"M-C-M"  vi-editing-mode
"M-C-R"  revert-line
"M-C-Y"  yank-nth-arg
"M-C-["  complete
"M-C-]"  character-search-backward
"M-space"  set-mark
"M-#"  insert-comment
"M-&"  tilde-expand
"M-*"  insert-completions
"M--"  digit-argument
"M-."  yank-last-arg
"M-0"  digit-argument
"M-1"  digit-argument
"M-2"  digit-argument
"M-3"  digit-argument
"M-4"  digit-argument
"M-5"  digit-argument
"M-6"  digit-argument
"M-7"  digit-argument
"M-8"  digit-argument
"M-9"  digit-argument
"M-<"  beginning-of-history
"M-="  possible-completions
"M->"  end-of-history
"M-?"  possible-completions
"M-B"  backward-word
"M-C"  capitalize-word
"M-D"  kill-word
"M-F"  forward-word
"M-L"  downcase-word
"M-N"  non-incremental-forward-search-history
"M-P"  non-incremental-reverse-search-history
"M-R"  revert-line
"M-T"  transpose-words
"M-U"  upcase-word
"M-Y"  yank-pop
"M-\"  delete-horizontal-space
"M-~"  tilde-expand
"M-C-?"  backward-kill-word
"M-_"  yank-last-arg
Emacs Control-X bindings

"C-XC-G"  abort
"C-XC-R"  re-read-init-file
"C-XC-U"  undo
"C-XC-X"  exchange-point-and-mark
"C-X("  start-kbd-macro
"C-X)"  end-kbd-macro
"C-XE"  call-last-kbd-macro
"C-XC-?"  backward-kill-line

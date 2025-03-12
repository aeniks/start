Commands for Moving
beginning-of-line (C-a)
Move to the start of the current line.
end-of-line (C-e)
Move to the end of the line.
forward-char (C-f)
Move forward a character.
backward-char (C-b)
Move back a character.
forward-word (M-f)
Move forward to the end of the next word. Words are composed of alphanumeric characters (letters and digits).
backward-word (M-b)
Move back to the start of the current or previous word. Words are composed of alphanumeric characters (letters and digits).
previous-screen-line
Attempt to move point to the same physical screen column on the previous physical screen line. This will not have the desired effect if the current readline line does not take up more than one physical line or if point is not greater than the length of the prompt plus the screen width.
next-screen-line
Attempt to move point to the same physical screen column on the next physical screen line. This will not have the desired effect if the current readline line does not take up more than one physical line or if the length of the current readline line is not greater than the length of the prompt plus the screen width.
clear-display (M-C-l)
Clear the screen and, if possible, the terminal's scrollback buffer, then redraw the current line, leaving the current line at the top of the screen.
clear-screen (C-l)
Clear the screen, then redraw the current line, leaving the current line at the top of the screen. With an argument, refresh the current line without clearing the screen.
redraw-current-line
Refresh the current line.
Commands for Manipulating the History
accept-line (Newline, Return)
Accept the line regardless of where the cursor is. If this line is non-empty, it may be added to the history list for future recall with add_history(). If the line is a modified history line, the history line is restored to its original state.
previous-history (C-p)
Fetch the previous command from the history list, moving back in the list.
next-history (C-n)
Fetch the next command from the history list, moving forward in the list.
beginning-of-history (M-<)
Move to the first line in the history.
end-of-history (M->)
Move to the end of the input history, i.e., the line currently being entered.
operate-and-get-next (C-o)
Accept the current line for return to the calling application as if a newline had been entered, and fetch the next line relative to the current line from the history for editing. A numeric argument, if supplied, specifies the history entry to use instead of the current line.
fetch-history
With a numeric argument, fetch that entry from the history list and make it the current line. Without an argument, move back to the first entry in the history list.
reverse-search-history (C-r)
Search backward starting at the current line and moving `up' through the history as necessary. This is an incremental search.
forward-search-history (C-s)
Search forward starting at the current line and moving `down' through the history as necessary. This is an incremental search.
non-incremental-reverse-search-history (M-p)
Search backward through the history starting at the current line using a non-incremental search for a string supplied by the user.
non-incremental-forward-search-history (M-n)
Search forward through the history using a non-incremental search for a string supplied by the user.
history-search-backward
Search backward through the history for the string of characters between the start of the current line and the current cursor position (the point). The search string must match at the beginning of a history line. This is a non-incremental search.
history-search-forward
Search forward through the history for the string of characters between the start of the current line and the point. The search string must match at the beginning of a history line. This is a non-incremental search.
history-substring-search-backward
Search backward through the history for the string of characters between the start of the current line and the current cursor position (the point). The search string may match anywhere in a history line. This is a non-incremental search.
history-substring-search-forward
Search forward through the history for the string of characters between the start of the current line and the point. The search string may match anywhere in a history line. This is a non-incremental search.
yank-nth-arg (M-C-y)
Insert the first argument to the previous command (usually the second word on the previous line) at point. With an argument n, insert the nth word from the previous command (the words in the previous command begin with word 0). A negative argument inserts the nth word from the end of the previous command. Once the argument n is computed, the argument is extracted as if the "!n" history expansion had been specified.
yank-last-arg (M-., M-_)
Insert the last argument to the previous command (the last word of the previous history entry). With a numeric argument, behave exactly like yank-nth-arg. Successive calls to yank-last-arg move back through the history list, inserting the last word (or the word specified by the argument to the first call) of each line in turn. Any numeric argument supplied to these successive calls determines the direction to move through the history. A negative argument switches the direction through the history (back or forward). The history expansion facilities are used to extract the last argument, as if the "!$" history expansion had been specified.
Commands for Changing Text
end-of-file (usually C-d)
The character indicating end-of-file as set, for example, by ``stty''. If this character is read when there are no characters on the line, and point is at the beginning of the line, readline interprets it as the end of input and returns EOF.
delete-char (C-d)
Delete the character at point. If this function is bound to the same character as the tty EOF character, as C-d commonly is, see above for the effects.
backward-delete-char (Rubout)
Delete the character behind the cursor. When given a numeric argument, save the deleted text on the kill ring.
forward-backward-delete-char
Delete the character under the cursor, unless the cursor is at the end of the line, in which case the character behind the cursor is deleted.
quoted-insert (C-q, C-v)
Add the next character that you type to the line verbatim. This is how to insert characters like C-q, for example.
tab-insert (M-TAB)
Insert a tab character.
self-insert (a, b, A, 1, !, ...)
Insert the character typed.
transpose-chars (C-t)
Drag the character before point forward over the character at point, moving point forward as well. If point is at the end of the line, then this transposes the two characters before point. Negative arguments have no effect.
transpose-words (M-t)
Drag the word before point past the word after point, moving point over that word as well. If point is at the end of the line, this transposes the last two words on the line.
upcase-word (M-u)
Uppercase the current (or following) word. With a negative argument, uppercase the previous word, but do not move point.
downcase-word (M-l)
Lowercase the current (or following) word. With a negative argument, lowercase the previous word, but do not move point.
capitalize-word (M-c)
Capitalize the current (or following) word. With a negative argument, capitalize the previous word, but do not move point.
overwrite-mode
Toggle overwrite mode. With an explicit positive numeric argument, switches to overwrite mode. With an explicit non-positive numeric argument, switches to insert mode. This command affects only emacs mode; vi mode does overwrite differently. Each call to readline() starts in insert mode. In overwrite mode, characters bound to self-insert replace the text at point rather than pushing the text to the right. Characters bound to backward-delete-char replace the character before point with a space. By default, this command is unbound.
Killing and Yanking
kill-line (C-k)
Kill the text from point to the end of the line.
backward-kill-line (C-x Rubout)
Kill backward to the beginning of the line.
unix-line-discard (C-u)
Kill backward from point to the beginning of the line. The killed text is saved on the kill-ring.
kill-whole-line
Kill all characters on the current line, no matter where point is.
kill-word (M-d)
Kill from point the end of the current word, or if between words, to the end of the next word. Word boundaries are the same as those used by forward-word.
backward-kill-word (M-Rubout)
Kill the word behind point. Word boundaries are the same as those used by backward-word.
unix-word-rubout (C-w)
Kill the word behind point, using white space as a word boundary. The killed text is saved on the kill-ring.
unix-filename-rubout
Kill the word behind point, using white space and the slash character as the word boundaries. The killed text is saved on the kill-ring.
delete-horizontal-space (M-\)
Delete all spaces and tabs around point.
kill-region
Kill the text between the point and mark (saved cursor position). This text is referred to as the region.
copy-region-as-kill
Copy the text in the region to the kill buffer.
copy-backward-word
Copy the word before point to the kill buffer. The word boundaries are the same as backward-word.
copy-forward-word
Copy the word following point to the kill buffer. The word boundaries are the same as forward-word.
yank (C-y)
Yank the top of the kill ring into the buffer at point.
yank-pop (M-y)
Rotate the kill ring, and yank the new top. Only works following yank or yank-pop.
Numeric Arguments
digit-argument (M-0, M-1, ..., M--)
Add this digit to the argument already accumulating, or start a new argument. M-- starts a negative argument.
universal-argument
This is another way to specify an argument. If this command is followed by one or more digits, optionally with a leading minus sign, those digits define the argument. If the command is followed by digits, executing universal-argument again ends the numeric argument, but is otherwise ignored. As a special case, if this command is immediately followed by a character that is neither a digit or minus sign, the argument count for the next command is multiplied by four. The argument count is initially one, so executing this function the first time makes the argument count four, a second time makes the argument count sixteen, and so on.
Completing
complete (TAB)
Attempt to perform completion on the text before point. The actual completion performed is application-specific. Bash, for instance, attempts completion treating the text as a variable (if the text begins with $), username (if the text begins with ~), hostname (if the text begins with @), or command (including aliases and functions) in turn. If none of these produces a match, filename completion is attempted. Gdb, on the other hand, allows completion of program functions and variables, and only attempts filename completion under certain circumstances.
possible-completions (M-?)
List the possible completions of the text before point. When displaying completions, readline sets the number of columns used for display to the value of completion-display-width, the value of the environment variable COLUMNS, or the screen width, in that order.
insert-completions (M-*)
Insert all completions of the text before point that would have been generated by possible-completions.
menu-complete
Similar to complete, but replaces the word to be completed with a single match from the list of possible completions. Repeated execution of menu-complete steps through the list of possible completions, inserting each match in turn. At the end of the list of completions, the bell is rung (subject to the setting of bell-style) and the original text is restored. An argument of n moves n positions forward in the list of matches; a negative argument may be used to move backward through the list. This command is intended to be bound to TAB, but is unbound by default.
menu-complete-backward
Identical to menu-complete, but moves backward through the list of possible completions, as if menu-complete had been given a negative argument. This command is unbound by default.
delete-char-or-list
Deletes the character under the cursor if not at the beginning or end of the line (like delete-char). If at the end of the line, behaves identically to possible-completions.
Keyboard Macros
start-kbd-macro (C-x ()
Begin saving the characters typed into the current keyboard macro.
end-kbd-macro (C-x ))
Stop saving the characters typed into the current keyboard macro and store the definition.
call-last-kbd-macro (C-x e)
Re-execute the last keyboard macro defined, by making the characters in the macro appear as if typed at the keyboard.
print-last-kbd-macro ()
Print the last keyboard macro defined in a format suitable for the inputrc file.
Miscellaneous
re-read-init-file (C-x C-r)
Read in the contents of the inputrc file, and incorporate any bindings or variable assignments found there.
abort (C-g)
Abort the current editing command and ring the terminal's bell (subject to the setting of bell-style).
do-lowercase-version (M-A, M-B, M-x, ...)
If the metafied character x is uppercase, run the command that is bound to the corresponding metafied lowercase character. The behavior is undefined if x is already lowercase.
prefix-meta (ESC)
Metafy the next character typed. ESC f is equivalent to Meta-f.
undo (C-_, C-x C-u)
Incremental undo, separately remembered for each line.
revert-line (M-r)
Undo all changes made to this line. This is like executing the undo command enough times to return the line to its initial state.
tilde-expand (M-&)
Perform tilde expansion on the current word.
set-mark (C-@, M-<space>)
Set the mark to the point. If a numeric argument is supplied, the mark is set to that position.
exchange-point-and-mark (C-x C-x)
Swap the point with the mark. The current cursor position is set to the saved position, and the old cursor position is saved as the mark.
character-search (C-])
A character is read and point is moved to the next occurrence of that character. A negative argument searches for previous occurrences.
character-search-backward (M-C-])
A character is read and point is moved to the previous occurrence of that character. A negative argument searches for subsequent occurrences.
skip-csi-sequence
Read enough characters to consume a multi-key sequence such as those defined for keys like Home and End. Such sequences begin with a Control Sequence Indicator (CSI), usually ESC-[. If this sequence is bound to "\[", keys producing such sequences will have no effect unless explicitly bound to a readline command, instead of inserting stray characters into the editing buffer. This is unbound by default, but usually bound to ESC-[.
insert-comment (M-#)
Without a numeric argument, the value of the readline comment-begin variable is inserted at the beginning of the current line. If a numeric argument is supplied, this command acts as a toggle: if the characters at the beginning of the line do not match the value of comment-begin, the value is inserted, otherwise the characters in comment-begin are deleted from the beginning of the line. In either case, the line is accepted as if a newline had been typed. The default value of comment-begin makes the current line a shell comment. If a numeric argument causes the comment character to be removed, the line will be executed by the shell.
dump-functions
Print all of the functions and their key bindings to the readline output stream. If a numeric argument is supplied, the output is formatted in such a way that it can be made part of an inputrc file.
dump-variables
Print all of the settable variables and their values to the readline output stream. If a numeric argument is supplied, the output is formatted in such a way that it can be made part of an inputrc file.
dump-macros
Print all of the readline key sequences bound to macros and the strings they output. If a numeric argument is supplied, the output is formatted in such a way that it can be made part of an inputrc file.
emacs-editing-mode (C-e)
When in vi command mode, this causes a switch to emacs editing mode.
vi-editing-mode (M-C-j)
When in emacs editing mode, this causes a switch to vi editing mode.

# vi

## behaviours

use `hjkl`

consider going cold turkey:
  - `nnoremap <up> <nop>`
  - `nnoremap <down> <nop>`
  - `nnoremap <left> <nop>`
  - `nnoremap <right> <nop>`

see also plugin hardtime

## splits

- `:vsp [file]`  vertical split (on new file)
- `:sp [file]`  horizontal split (on new file)
- `:10sp [file]`  open split with predefined height
- `:q` quit current split 
- `:only`  closes everything apart from current window
- `ctrl-w jklh`  move between splits
- `ctrl-w w`  cycle through splits
- `ctrl-w _`  maximize current split (vertical, for horizontal use |)
- `ctrl-w =`  equal splits
- `Ctrl-w n+`  increase current split by n lines (- for decrease)
- `:help splits`  help
- `ctrl-w s`  split current window
- `:help ctrl-w`


## general

[command] [repetition count] [object]

or

Verb, Modifier, Noun

## text objects

From http://codyveal.com/posts/vim-killer-features-part-1-text-objects/

All text objects come in two forms, normal and inner (prefixed by a and i, respectively). As a
general rule, normal text objects include the characters that delimit the object, while the inner
form will leave the delimiters intact.

- Word by punctuation: aw/iw
- Word by whitespace: aW/iW (see :help WORD)
- Sentence: as/is
- Paragraph: ap/ip
- Quotes: a“/i“
- Parentheses: a)/i)
- Brackets: a]/i]
- Braces: a}/i}
- Angle Brackets: a>/i>
- Tags (e.g. <html>inner</html>): at/it

## change/insert

- `i` insert before cursor
- `a` insert after cursor
- `I` insert at beginning of line
- `A` append at the end of the line
- `o` line after
- `C` Delete the line from where you’re at, and enter insert mode
- `dd` delete line and stay in normal mode
- `S` Delete the entire line you’re on, and enter insert mode

- `s` substitute and changed to insert mode
- `r` replace character and stay in command mode

## copying 

- `yy` yank current line


## movement

- `h` moves the cursor one character to the left.
- `j` moves the cursor down one line.
- `k` moves the cursor up one line.
- `l` moves the cursor one character to the right.
- `0|^` moves the cursor to the beginning of the line.
- `$` moves the cursor to the end of the line.
- `w` move forward one word (consider ea for edit)
- `e` move to end of word (use a for following edits)
- `b` move backward one word.
- `G` move to the end of the file.
- `gg` move to the beginning of the file.
- `.` move to the last edit.
- `%` go to matching parenthesis (any)
- `(|)` move backward/forward one sentence
- `{|}` move backward/forward one paragraph
- `:no` move to line number `no`
- `ctrl-i`: jump to previous navigation
- `ctrl-o`: jump back to where you were
- `H,M,L`: move cursor within screen (high, medium, low)
- `ctrl-f`: half a page down
- `ctrl-d`: half a page up

You can move a line, or a block of lines, with the :m command. Examples:

- `:m 12` move current line to after line 12
- `:m 0` move current line to before first line
- `:m $` move current line to after last line

To move a block of lines, use the same command but visually select the lines before entering the
move command. 

You can also use arbitrary ranges with the move command. Examples:

- `:5,7m 21` move lines 5, 6 and 7 to after line 21
- `:5,7m 0` move lines 5, 6 and 7 to before first line
- `:5,7m` move lines 5, 6 and 7 to after last line
- `:3m0` move line three to beginning

prefacing a movement command with a number will execute that movement multiple times.


## windows

- `ctrl-w w` to toggle
- `:split` file open file
- `ctrl-w _` to maximize current window

## deletion

- d starts the delete operation.
- dw will delete a word to end from current position
- db will delete a word backward from current position
- d0 will delete to the beginning of a line.
- d$ will delete to the end of a line.
- dgg will delete to the beginning of the file.
- dG will delete to the end of the file.
- daw Delete A Word (under cursor)
- u will undo the last operation.
- Ctrl-r will redo the last undo.
- dd delete current line
- D delete to end of line (see also S above)

- J join lines

## search and replace

- /text search for text in the document, going forward.
- ?text search for text in the document, going backwards.
- n move the cursor to the next instance of the text from the last search. This will wrap to the beginning of the document.
- N move the cursor to the previous instance of the text from the last search.
- :%s/text/replacement text/g search through the entire document for text and replace it with replacement text.
- :%s/text/replacement text/gc search through the entire document and confirm before replacing text.
- as above but without %: only current line

## special commands in insert mode

- ctrl-d          Delete one shiftwidth of indent
- ctrl-t          Insert one shiftwidth of indent at the start of the current line
- ctrl-u          Delete all entered characters before the cursor
- ctrl-w          Delete the word before the cursor

see also `:help ins-special-keys`

## visual

- v for visual mode on characters
- V for visual mode on lines
- `vip` visually select paragraph (ip is a so called object)
- ctrl-v for block selection. allows edit with I, which are made on all multiple lines after hitting Esc
  (needs prefix ctrl-q on windows, i.e ctrl-q + ctrl-v + select + I + edit + esc

## searching

- f|F x for finding x (e.g. 3fq finds third q)
- t|T x as f (til) puts cursor before
- ; repeats f & t
I find f and t very useful in combination with d and c. For example,  ct: will let you replace
everything from your cursor up to the next colon, but not delete the colon. You can remember it as
"change to colon".


- /string search forward for string
- ?string search bcakward for string
- n for next
- N for previous
- `*` search for instances of word under cursor
- `#` same but backwards


# copy and paste

The last text that you've deleted is stored in the buffer ready to be
pasted with p or P back into the document


- v highlight one character at a time.
- V highlight one line at a time.
- Ctrl-v highlight by columns.
- p paste text after the current line.
- P paste text on the current line.
- y yank text into the copy buffer.

# files

- ZZ | :wq write and exit

# misc

- ~ toggle case
- u/U lower/upper case

- :set spell  to enable spelling mode
- :h quickref  for quickref
- :>> indent current line
- :<< unindent current line
- 5>> indent next five lines
- .  repeat last command
- :oldfiles  for a list of recent files
- :r! command : run command and insert its output
- :! command : run command and return (unaltered) after hitting enter
- !! command : insert command
- ! command : change text
- :G! command : runs command on text from current pos to end
- CMD + - : zoom out macvim
- CMD + = : zoom in macvim

- CMD/ctrl++ : zoom in terminal
- CMD/ctrl+- : zoom out terminal
- CMD/cmd+0 : Normal default size

- gq: wrap text

https://stackoverflow.com/questions/2280030/how-to-stop-line-breaking-in-vim
To turn off physical line wrapping, clear both the textwidth and wrapmargin buffer options:
set textwidth=0 wrapmargin=0

# tabs

http://vim.wikia.com/wiki/Using_tab_pages

- `:tabn` or `gt`: next tab
- `:tabp` or `gT`: prev tab
- `:tabedit`: open file in new tab
- `:tabclose`
 
# registers

- help :registers
- :reg  list all current registers
- unnamed register: ""
- 0 register: last yank command
- just prefix command with  "<name>
- flow: yank line: yy, move to differentl line, delete line: dd, "0p
- ctrl-r <name>  access register <name>
- vim automatically registers numbered registers
- "% is one of the read only registers. it holds the name of the current file

# buffer

- `:bd` close buffer
- `:bnext` next buffer
- `:buffers` list buffer
- `:ls` list all buffers
- `:new` open new buffer
- `ctrl b`: prev buffer
- `ctrl f`: next buffer


# remote

- `vim --servername SERVER` to start a vim instance 
- `vim --servername SERVER --remote FILE` to open the file in the named vim instance.


macOS only:
MacVim runs a server by default - you can use mvim --remote-tab-silent to open a file in a new tab in your existing MacVim instance, or mvim --remote-silent to open the file in a new buffer in the same tab.

https://vi.stackexchange.com/questions/317/can-i-open-a-file-in-an-existing-vim-instance-from-an-external-command


# remot editing

- `vim scp://host//file`
- Within session use `:Nread` and `:Nwrite` with above

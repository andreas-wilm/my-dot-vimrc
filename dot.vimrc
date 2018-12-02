" BEGIN https://vimconfig.com/
"
" Overlaps partially with vim-sensible
"
" set number	" Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)

set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally

set autoindent	" Auto-indent new lines
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab

set ruler	" Show row and column ruler information
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
"
" END https://vimconfig.com/


" BEGIN misc
"
" hybrid line numbers: https://jeffkreeftmeijer.com/vim-number/
set number relativenumber
set undofile

" remapping arrow keys to make sure we're only using hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>


" select last paste in visual mode
" you can select the original yanked text with gv . And, select last pasted text with gb . gb is a custom mapping 
" https://dalibornasevic.com/posts/43-12-vim-tips
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'


" "fix Vim’s horribly broken default regex “handling” by automatically inserting a \v before any string you search for. This turns off Vim’s crazy default regex characters and makes searches use normal regexes. I already know Perl/Python compatible regex formatting, why would I want to learn another scheme?"
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
nnoremap / /\v
vnoremap / /\v

" gdefault applies substitutions globally on lines. For example, instead of :%s/foo/bar/g you just type :%s/foo/bar/. This is almost always what you want (when was the last time you wanted to only replace the first occurrence of a word on a line?) and if you need the previous behavior you just tack on the g again.
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
set gdefault

"
" END misc


" Plugin manager vim-plug: https://github.com/junegunn/vim-plug
call plug#begin()

"Plug 'chriskempson/base16-vim'
"Plug 'morhetz/gruvbox'
"Plug 'danilo-augusto/vim-afterglow'
Plug 'rafi/awesome-vim-colorschemes'
"Plug 'vim-scripts/darktango.vim'

"Plug 'roman/golden-ratio'
Plug 'ervandew/supertab'
"Plug 'Valloric/YouCompleteMe'


Plug 'jamessan/vim-gnupg'
" Armor files
let g:GPGPreferArmor=1
" Set the default option
let g:GPGDefaultRecipients=["andreas.wilm@gmail.com"]

" This plugin overwrites CTRL-f, CTRL-b, CTRL-d, CTRL-u, zt, zz, and zb with code that scrolls the
" lines fluidly to help the user know how far they are scrolling in the file.
Plug 'cskeeters/vim-smooth-scroll'

Plug 'zah/nim.vim'
" Plug 'pangloss/vim-javascript'
fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe 'norm! \<C-]>'
  endif
endf
" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

Plug 'tpope/vim-sensible'

Plug 'tomtom/tcomment_vim'
" in visual mode: gc : Toggle comments
" gcc : Toggle comment for the current line
" https://github.com/tomtom/tcomment_vim

" http://ctrlpvim.github.io/ctrlp.vim/
Plug 'ctrlpvim/ctrlp.vim'
map ; :CtrlPMixed<CR>
" switch to fzf instead?

" Plug 'ntpeters/vim-better-whitespace'
Plug 'bronson/vim-trailing-whitespace'

" Plug 'nathanaelkane/vim-indent-guides'
" http://sherifsoliman.com/2016/05/30/favorite-vim-plugins/
" let g:indent_guides_guide_size = 1
" let g:indent_guides_color_change_percent = 3
" let g:indent_guides_enable_on_vim_startup = 1
" set background=dark

" Plug 'https://github.com/vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'

Plug 'godlygeek/tabular'

let g:ale_completion_enabled = 1
Plug 'w0rp/ale'


"Plug 'vim-syntastic/syntastic'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0



"" deoplete
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1


" Plug 'https://github.com/kien/rainbow_parentheses.vim'
" Plug 'https://github.com/mtth/scratch.vim'
" make hlsearch more useful, e.g. disable highlight after done
Plug 'romainl/vim-cool'
call plug#end()


" scratch
" let g:scratch_height = 0.5 
" let g:scratch_persistence_file = $HOME . 'scratch.md'


" keep selected text selected when fixing indentation
" https://kinbiko.com/vim/my-shiniest-vim-gems/
vnoremap < <gv
vnoremap > >gv


" BEGIN themes and colorschemes
"

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" gruvbox
"let g:gruvbox_italics= 1
"colorscheme gruvbox

" looks interesting: badwolf https://github.com/sjl/badwolf

colorscheme afterglow
"colorscheme materialbox

" base16 for vim: https://github.com/chriskempson/base16-vim
" not support in iTerm2?! at least colortest fails
" if you have base16-shell installed, this matches the theme from your
" terminal
" The file .vimrc_background should update automatically on theme change
" You can find base16-shell here: https://github.com/chriskempson/base16-shell
"if filereadable(expand("~/.vimrc_background"))
"  let base16colorspace=256
"  source ~/.vimrc_background
"endif
"colorscheme base16-material

set guifont=Menlo\ Regular:h14


"
" END themes and colorschemes


" https://stackoverflow.com/questions/8247243/highlighting-the-current-line-number-in-vim
" after colorschemes to overwrite
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline
" set cursorline itself is confusing with split

" Disable vim automatic visual mode on mouse select
" https://gist.github.com/u0d7i/01f78999feff1e2a8361
set mouse-=a
" set mouse=a " mouse scroll works. but visual mode on selection

" http://vimcasts.org/episodes/show-invisibles/
" Shortcut to rapidly toggle `set list`: \l
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬


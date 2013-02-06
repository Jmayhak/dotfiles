call pathogen#infect()
call pathogen#helptags()
" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
set background=dark
colorscheme solarized

" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set t_Co=256
set tabstop=2
" Show “invisible” characters nolist = hide, and list = show
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set nolist
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers when visual mode and absolute for insert
set rnu
au BufEnter * :set rnu
au BufLeave * :set nu
au WinEnter * :set rnu
au WinLeave * :set nu
au InsertEnter * :set nu
au InsertLeave * :set rnu
au FocusLost * :set nu
au FocusGained * :set rnu
"
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
    " for cakephp
    autocmd BufNewFile,BufRead *.ctp setfiletype=php syntax=php
endif

set autochdir
let NERDTreeChDirMode=2
nnoremap <leader><leader> :NERDTreeToggle .<CR>
map <C-p> :tabprevious<CR>
map <C-n> :tabnext<CR>
nmap n nzz
nmap N Nzz
set expandtab
set tabstop=4
set shiftwidth=4
map <F2> :retab <CR>

" map <leader>ff g:Jsbeautify()

" Autocomplete for php
filetype plugin on
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" smarter indenting... remember where you were
set autoindent
set cindent
set smartindent
noremap <leader>j :call GetPhpIndent()<CR>

map <C-j> ggvG$=

" center page on space bar click
nmap <space> zz
" copy/paste multiple times at a time
xnoremap p pgvy

set foldmethod=indent
set foldnestmax=10
set foldlevel=1

run SyntasticEnable php
"set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_echo_current_error=1
let g:syntastic_auto_jump=1

let g:EasyMotion_leader_key = '<Leader>f'

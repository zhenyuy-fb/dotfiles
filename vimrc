" Use Vim settings, rather then Vi settings (much better!).
"
" This must be first, because it changes other options as a side effect.
set nocompatible

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" ================ General Config ====================

set number                      "Line numbers are good
set relativenumber
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
" set cursorline                  "Set the cursorline
" set cursorcolumn

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundles.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif

" ================ turn off swap files ==============

set noswapfile
set nobackup
set nowb

" ================ persistent undo ==================
" keep undo history across sessions, by storing in file.
" only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"
" ================ Copy and Paste ========================
" use system clipboard to enable copy and paste outside of vim
set clipboard=unnamedplus

" faster redrawing
set ttyfast

" ================ Moving ========================
" use space to pagedown, which is cosistent with most web browsers
nmap <Space> <C-f>

"
" =========== === Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

" re-define highlighting via the ColorScheme event
autocmd ColorScheme * highlight Search term=reverse cterm=reverse ctermfg=2 guifg=White guibg=Purple

" enable cursor line and change it's color scheme
autocmd ColorScheme * highlight CursorLine cterm=NONE ctermbg=darkgreen ctermfg=white guibg=darkred guifg=white

" ================ Tab  ===========================
" close current tab without closing window
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" ================ NerdTree ===========================
" sync NERDTree's directory to the current file's directory
map <leader>r :NERDTreeFind<cr>

" toggle NERDTree with ctrl + \
map <C-o> :NERDTreeTabsToggle<CR>
map <Leader>n <plug>NERDTreeTabsToggle<CR>


" easily edit vimrc file and reload it
:nnoremap <leader>vv :vsplit $MYVIMRC<cr>
:nnoremap <leader>vs :source $MYVIMRC<cr>

" reload the vimrc immediately after saving
autocmd BufWritePost $MYVIMRC source $MYVIMRC

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
" ================ Convenient Settings ========================
" delete in insert mode with 'dd'
:imap <c-d> <esc>ddi
:nmap <leader>; mqA;<esc>`q
:nmap <leader>B :tabnew<cr>
set autochdir         " automatically change the current dir

" ================ Custom Settings ========================
so ~/.yadr/vim/settings.vim

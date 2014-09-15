
" Vundle setup
  set nocompatible
  filetype off                   " required!

  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()

  " let Vundle manage Vundle
  " required!
  Bundle 'gmarik/vundle'

  " Vim
    " Bundle 'Lokaltog/vim-powerline'
    Bundle 'markabe/bufexplorer'
    Bundle 'mileszs/ack.vim'
    Bundle 'wycats/nerdtree'
    Bundle 'git://git.wincent.com/command-t.git'
    " Bundle 'git://bitbucket.org/ns9tks/vim-fuzzyfinder.git'
    Bundle 'tpope/vim-endwise'
    Bundle 'ervandew/supertab'
    Bundle 'tpope/vim-surround'
    Bundle 'tpope/vim-repeat'
    Bundle 'tpope/vim-unimpaired'
    Bundle 'michaeljsmith/vim-indent-object'
    Bundle 'tpope/vim-commentary'
    Bundle 'bbommarito/vim-slim'
    Bundle 'scrooloose/syntastic'
    Bundle 'vim-scripts/paredit.vim'
    Bundle 'gorkunov/smartpairs.vim'
    Bundle 'tpope/vim-fireplace'
    Bundle 'tpope/vim-classpath'
    Bundle 'kien/ctrlp.vim'
    Bundle 'jeffkreeftmeijer/vim-numbertoggle'
    Bundle 'terryma/vim-multiple-cursors'
    Bundle 'myusuf3/numbers.vim'
    Bundle 'Lokaltog/vim-easymotion'

  " Themes
    Bundle 'altercation/vim-colors-solarized'

  " Languages & Technologies
  "
    " Rails
      Bundle 'tpope/vim-rails'

    " Ruby
      Bundle 'vim-ruby/vim-ruby'

    " JavaScript
      Bundle 'pangloss/vim-javascript'

    " CoffeeScript
      Bundle 'kchmck/vim-coffee-script'

    " Scala
      Bundle 'rosstimson/scala-vim-support'

    " Clojure
      Bundle 'vim-scripts/VimClojure'

    " Haskell
      Bundle 'lukerandall/haskellmode-vim'

  filetype on


" BASICS

  set number
  set relativenumber

  let g:NumberToggleTrigger="<F2>"

  set ruler
  syntax on

  " Set encoding
  set encoding=utf-8

  " Remap Leader key
  let mapleader=","

  " Whitespace stuff
  set nowrap
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
  set expandtab
  set list listchars=tab:\ \ ,trail:·

  set cindent
  set smartindent
  set autoindent

  " Tab completion
  set wildmode=list:longest,list:full
  set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

  " Status bar
  set laststatus=2

  " Searching
  set hlsearch
  set incsearch
  set ignorecase
  set smartcase

  " Relative numbers by default
  set relativenumber

  " set backup                     " Enable creation of backup file.
  " set backupdir=~/.vim/backups   " Where backups will go.
  set directory=~/.vim/tmp       " Where temporary files will go.

  set noswapfile


" INTERFACE

  set t_Co=256
  set guifont=Monaco:h13
  color Tomorrow-Night-Eighties

  " Disable <Arrow keys>
  " inoremap <Up> <NOP>
  " inoremap <Down> <NOP>
  " inoremap <Left> <NOP>
  " inoremap <Right> <NOP>
  " noremap <Up> <NOP>
  " noremap <Down> <NOP>
  " noremap <Left> <NOP>
  " noremap <Right> <NOP>

  " Ability to move with pressed Ctrl key
  imap <C-h> <C-o>h
  imap <C-j> <C-o>j
  imap <C-k> <C-o>k
  imap <C-l> <C-o>l

  " Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
  au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru,*.pill,*.prawn,*.rabl,*.jam}    set ft=ruby
  au BufRead,BufNewFile {*.cljs}    set ft=clojure

" AUTOCOMANDS
"
  " Switch to normal mode after save
  autocmd BufWrite * stopinsert

  " Restore last cursor position in file
  autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif

" SHORTCUTS

  " Open .vimrc in a new tab
  nmap <Leader>vc :tabedit $MYVIMRC<CR>

  " Create splits
  nmap <Leader>v :vsplit <cr>
  nmap <Leader>s :split <cr>

  " Clear highlight
  nnoremap <Leader>c :nohls<CR><C-L>

  " Navigate between splits
  map <Leader>h <C-w>h
  map <Leader>j <C-w>j
  map <Leader>k <C-w>k
  map <Leader>l <C-w>l

  " Toggle relativenumber option
  map <Leader>n :set relativenumber<CR>
  map <Leader>N :set number<CR>

  " Fix Trailing White Space
  map <leader>ts :%s/\s\+$//e<CR>

" PLUGINS
  let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']
  let g:EasyMotion_leader_key = '<leader>'

  " Search work under cursor with Ack
  noremap <Leader>aw :Ack <cword><CR>
  noremap <Leader>a :Ack

  " Cmd+D map to toggle NERDTree
  imap <Leader>d :NERDTreeToggle<CR>
  nmap <Leader>d :NERDTreeToggle<CR>

  " NERDTree configuration
  let NERDTreeIgnore=['\.rbc$', '\~$']
  let g:NERDTreeDirArrows=0

  " Command-T configuration
  let g:CommandTMaxHeight=10
  map <D-e> :CommandT<CR>

  " Show syntax highlighting groups for word under cursor
  nmap <C-S-P> :call <SID>SynStack()<CR>
  function! <SID>SynStack()
    if !exists("*synstack")
      return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
  endfunc

  " VimCLojure

  let maplocalleader=","
  let vimclojure#HighlightBuiltins=1
  let vimclojure#HighlightContrib=1
  let vimclojure#DynamicHighlighting=1
  let vimclojure#ParenRainbow=1
  let vimclojure#WantNailgun = 1
  let vimclojure#NailgunClient = "/usr/local/bin/ng"

  let g:paredit_mode=1

function TrimEndLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction

function RemoveTrailingSpaces()
    :%s/\s\+$//e
endfunction

au BufWritePre * call TrimEndLines()
au BufWritePre * call RemoveTrailingSpaces()

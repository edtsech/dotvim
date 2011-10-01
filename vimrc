set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'markabe/bufexplorer'
Bundle 'mileszs/ack.vim'
Bundle 'rails.vim'
Bundle 'wycats/nerdtree'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'tpope/vim-endwise'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'pangloss/vim-javascript'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'tpope/vim-commentary'
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"
"

"============ Basics ============"

autocmd BufWrite * call RemoveTrailingSpacesOnBufRead()

set number
set ruler
syntax on

" Set encoding
set encoding=utf-8

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

" set backup                     " Enable creation of backup file.
" set backupdir=~/.vim/backups   " Where backups will go.
set directory=~/.vim/tmp       " Where temporary files will go.

set noswapfile


"============ Autocommands ============"

" Switch to normal mode after save
autocmd BufWrite * stopinsert

" Restore last cursor position in file
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


"============ Look and Feel ============"

color Tomorrow
set guifont=Monaco:h12

" Start without the toolbar
set guioptions-=T
set guioptions-=L

" Remove scrolls
set guioptions-=l
set guioptions-=R
set guioptions-=r

" Show numbers
set number

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

"============ Shortcuts ============"

" Create splits
nmap <Leader>v :vsplit <cr>
nmap <Leader>h :split <cr>

" Clear highlight
nnoremap <Leader>c :nohls<CR><C-L>

" Navigate between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Add Firefox-like tab navigation
let i=1
while i<=9
  execute "nmap <D-".i."> ".i."gt"
  execute "vmap <D-".i."> ".i."gt"
  execute "imap <D-".i."> <ESC>".i."gt"
  let i+=1
endwhile

" TextMate like indenting
imap <D-[> <ESC><<
imap <D-]> <ESC>>>
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Toggle relativenumber option
map <Leader>n :set relativenumber<CR>
map <Leader>N :set number<CR>


"============ Plugins config ============"

" Ack config
noremap <Leader>a :Ack <cword><CR>

" Cmd+D map to toggle NERDTree
imap <D-d> :NERDTreeToggle<CR>
nmap <D-d> :NERDTreeToggle<CR>

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$']

" Command-T configuration
let g:CommandTMaxHeight=10
map <D-e> :CommandT<CR>

" NERDTree utility function
function s:UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif

  if exists(":CommandTFlush") == 2
    CommandTFlush
  endif
endfunction

function! RemoveTrailingSpaces()
  | :%s/\s\+$//e |
endfunction

function! RemoveTrailingSpacesOnBufRead()
  if &modifiable
    call RemoveTrailingSpaces()
  endif
endfunction


" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru,*.pill,*.prawn,*.rabl,*.jam}    set ft=ruby


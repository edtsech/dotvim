
"============ Pathogen ============"

filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

autocmd BufWrite * call RemoveTrailingSpacesOnBufRead()

"============ Basics ============"

set nocompatible " Turn off vi compatible

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

color tango
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


" Previous - Next buffer
map <C-S-Left> :bprev<CR>
map <C-S-Right> :bnext<CR>
map <D-M-Left> :tabprev<CR>
map <D-M-Right> :tabnext<CR>

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

""" Rails.vim
" autocmd User Rails.javascript* set expandtab ts=4 sw=4 sts=4
" autocmd User Rails/*/.coffee set expandtab ts=2 sw=2 sts=2

" Move block of text
"vmap <C-h> <gv
"vmap <C-l> >gv
"vmap <C-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z
"vmap <C-j> :m'>+<CR>gv=`<my`>mzgv`yo`z

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

" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" Command-/ to toggle comments
map <D-/> <plug>NERDCommenterToggle<CR>

" Command-][ to increase/decrease indentation
vmap <D-]> >gv
vmap <D-[> <gv

" Command-Option-ArrowKey to switch viewports
map <D-M-Up> <C-w>k
imap <D-M-Up> <Esc> <C-w>k
map <D-M-Down> <C-w>j
imap <D-M-Down> <Esc> <C-w>j
map <D-M-Right> <C-w>l
imap <D-M-Right> <Esc> <C-w>l
map <D-M-Left> <C-w>h
imap <D-M-Left> <C-w>h

" Markdown preview
map <leader>p :Mm<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=
imap <Leader>= <Esc> <C-w>=

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


"
" Pathogen
"
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

"
" Autocommands
"

" Switch to normal mode after save
autocmd BufWrite * stopinsert

" Restore last cursor position in file
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"
" Look and Feel
"

color molokai
set guifont=Monaco:h12

" Start without the toolbar
set guioptions-=T


"
" Shortcuts
"

" Previous - Next buffer
map <C-S-Left> :bprev<CR>
map <C-S-Right> :bnext<CR>
map <D-M-Left> :tabprev<CR>
map <D-M-Right> :tabnext<CR>


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

" Move block of text
vmap <C-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z

" Toggle relativenumber option
map <Leader>n :set relativenumber<CR>
map <Leader>N :set number<CR>

"
" Plugins config
"

" Ctrl+D map to toggle NERDTree
imap <D-d> :NERDTreeToggle<CR>
nmap <D-d> :NERDTreeToggle<CR>

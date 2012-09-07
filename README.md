## Installation

1. `for i in ~/.vim ~/.vimrc ~/.gvimrc; do [ -e $i ] && mv $i $i.old; done`
2. `git clone git://github.com/edtsech/dotvim.git ~/.vim`
3. `git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`
4. `cd ~/.vim`
5. `rake`
6. launch `vim` and run `:BundleInstall`

## Compile CommandT
1. `cd ~/.vim/bundle/command-t`
2. `rake make`

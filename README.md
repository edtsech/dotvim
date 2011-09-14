## Installation

1. for i in ~/.vim ~/.vimrc ~/.gvimrc; do [ -e $i ] && mv $i $i.old; done
2. git clone git://github.com/edtsech/dotvim.git ~/.vim
3. cd ~/.vim
4. rake
5. launch `vim` and run `:BundleInstall`

plugin "ack.vim",     	   "git://github.com/mileszs/ack.vim.git"
plugin "bufexplorer",      "git://github.com/corntrace/bufexplorer.git"
plugin "haml",             "git://github.com/tpope/vim-haml.git"
plugin "indent_object",    "git://github.com/michaeljsmith/vim-indent-object.git"
plugin "javascript",       "git://github.com/pangloss/vim-javascript.git"
plugin "jslint",           "git://github.com/hallettj/jslint.vim.git"
plugin "markdown_preview", "git://github.com/robgleeson/vim-markdown-preview.git"
plugin "nerdtree",         "git://github.com/wycats/nerdtree.git"
plugin "nerdcommenter",    "git://github.com/ddollar/nerdcommenter.git"
plugin "surround",         "git://github.com/tpope/vim-surround.git"
plugin "taglist",          "git://github.com/vim-scripts/taglist.vim.git"
plugin "supertab",         "git://github.com/ervandew/supertab.git"
plugin "cucumber",         "git://github.com/tpope/vim-cucumber.git"
plugin "textile",          "git://github.com/timcharper/textile.vim.git"
plugin "rails",            "git://github.com/tpope/vim-rails.git"
plugin "rspec",            "git://github.com/taq/vim-rspec.git"
plugin "zoomwin",          "git://github.com/vim-scripts/ZoomWin.git"
plugin "snipmate",         "git://github.com/msanders/snipmate.vim.git"
plugin "markdown",         "git://github.com/tpope/vim-markdown.git"
plugin "align",            "git://github.com/tsaleh/vim-align.git"
plugin "unimpaired",       "git://github.com/tpope/vim-unimpaired.git"
plugin "endwise",          "git://github.com/tpope/vim-endwise.git"
plugin "vim-coffee-script","git://github.com/kchmck/vim-coffee-script.git"
plugin "syntastic",        "git://github.com/scrooloose/syntastic.git"
plugin "scala",            "git://github.com/bdd/vim-scala.git"
plugin "gist-vim",         "git://github.com/mattn/gist-vim.git"

plugin "command_t",        "git://github.com/wincent/Command-T.git" do
  sh "find ruby -name '.gitignore' | xargs rm"

  Dir.chdir "ruby/command-t" do
    if File.exists?("/usr/bin/ruby1.8") # prefer 1.8 on *.deb systems
      sh "/usr/bin/ruby1.8 extconf.rb"
    elsif File.exists?("/usr/bin/ruby") # prefer system rubies
      sh "/usr/bin/ruby extconf.rb"
    elsif `rvm > /dev/null 2>&1` && $?.exitstatus == 0
      sh "rvm system ruby extconf.rb"
    end
    sh "make clean && make"
  end
end


color  "molokai",          "https://github.com/mrtazz/molokai.vim/raw/master/colors/molokai.vim"
color  "vwilight",         "https://gist.github.com/raw/796172/724c7ca237a7f6b8d857c4ac2991cfe5ffb18087/vwilight.vim"

`mkdir colors`
`mkdir bundle`
`rm -rf bundle`

def notice(text)
  puts
  puts "*" * 40
  puts "*#{"Installing #{text}".center(38)}*"
  puts "*" * 40
  puts
end

def color(name, source)
  notice(name)
  `curl #{source} > colors/#{name}.vim`
end

def plugin(name, source)
  notice(name)

  dir = File.expand_path("bundle/#{name}")

  if source =~ /git$/
    sh "git clone #{source} #{dir}"
  end
end

desc "Create symlinks"
task :create_symlinks do
  %w[ vimrc ].each do |file|
    dest = File.expand_path("~/.#{file}")
    unless File.exist?(dest)
      ln_s(File.expand_path("../#{file}", __FILE__), dest)
    end
  end
end

# Install plugins
import(File.expand_path("Plugins.rake"))

task :default => [:create_symlinks]

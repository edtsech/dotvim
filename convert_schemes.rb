#
# Bulk convert
#

base_path = File.expand_path('~/Library/Application Support/TextMate/Themes/')

Dir.open(base_path).each do |f|
  if f[0] != '.'
    `tm2vim "#{File.join(base_path, f)}" "#{File.join(File.expand_path('~/.vim/colors/'), f.gsub('tmTheme', 'vim').gsub(/\s/, '_').downcase)}"`
  end
end

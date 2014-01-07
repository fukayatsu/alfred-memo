#!/usr/bin/env ruby

require 'fileutils'

STORE_DIR = "/Users/fukayatsu/Dropbox/alfred-memo"
EDITOR    = "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"
FILE_EXT  = ".md"
FileUtils.mkdir_p(STORE_DIR)

date_str  = Time.now.strftime("%Y-%m-%d")
time_str  = Time.now.strftime("%H:%M")
file_path = "#{STORE_DIR}/#{date_str}#{FILE_EXT}"

query     = ARGV[0]
if query.length == 0
  return system(EDITOR, '-n', '-a', STORE_DIR, file_path)
end

query = query.encode("UTF-8", "UTF-8-MAC")
new_line = "#{time_str} #{query}"
File.open(file_path, 'a') do |file|
  file.puts new_line
end

puts "saved: #{new_line}"

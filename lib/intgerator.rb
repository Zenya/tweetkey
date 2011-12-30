require "rubygems"
require "fileutils"
require 'active_support/inflector'

@item = "proposal"
@items = "proposal".pluralize
@path = "/home/slavik/ror/tweetkey"

ARGV.each do|a|
  @from = "#{@path}/app/views/#{@item.pluralize}/#{a}.haml"
  @to = "#{@path}/lib/generators/ria/templates/#{a}.haml"
  FileUtils.cp @from, @to
  text = File.read(@to)
  replace = text.gsub(@items, "<%=plural_name%>")
  replace = replace.gsub(@item, "<%=file_name%>")
  File.open(@to, "w") {|file| file.puts replace}
end

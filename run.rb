require_relative 'parser'

url = ARGV[0]
Parser.new(url).start
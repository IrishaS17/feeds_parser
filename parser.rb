require_relative 'atom_feed_parser'
require_relative 'rss_feed_parser'
require_relative 'irish_feed_parser'
require_relative 'feeds_parser'

class Parser
  
	def initialize url
		if check_url url
		  @url = url
		else
			puts "This url is incorrect! Try again."
		end
	end

	def check_url url
	  if /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/ =~ url
	  	return true
	  else
	  	return false
	  end
	end

	def start 
	  FeedsParser.new(@url).define_type_url
	end

end
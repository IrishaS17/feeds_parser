require 'json'

class FeedsParser
  
	def initialize url
		@url = url
	end

  def define_type_url 
		feeds = []
		if /atom/ =~ @url
			feeds = AtomFeedParser.new(@url).atom_feed
	  elsif /rss|xml/.match @url
		  feeds = RSSFeedParser.new(@url).rss_feed	 
		elsif /irish-blog/ =~ @url
			feeds = IrishFeedParser.new(@url).irish_feed
		else
			puts "Incorrect url! For facebook news using url like fbrss.com/.."
			return
	  end
	  puts JSON.pretty_generate(feeds)
	end

end
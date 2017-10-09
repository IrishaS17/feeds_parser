require_relative 'parser.rb'
require 'rss'

class RSSFeedParser
  include Reader

  def initialize url
    @rss = RSS::Parser.parse(url, false)
  end

  def rss_feed
  	feeds = []
		@rss.items.each do |item|
	    title = item.title
	    author = item.author
	    category = item.category.content
	    description = item.description
	    date = item.pubDate
	    feeds << Reader::feeds_push(title, date, category, description, author, nil)
    end
    return feeds 
  end
end
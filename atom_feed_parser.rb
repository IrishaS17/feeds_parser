require_relative 'reader.rb'
require 'feedjira'
require 'httparty'

class AtomFeedParser
  include Reader

  def initialize url
    @atom = read_content(url)
  end 

  def read_content url 
    xml = HTTParty.get(url).body
		return Feedjira::Feed.parse(xml)	
  end

  def atom_feed 
  	feeds = []
	 	@atom.entries.each do |entry|
	    title = entry.title
	    author = entry.author
	    date = entry.published
	    category = entry.categories.map { |category| category.strip }
	    description = entry.summary
	    if description.nil?
	    	description = entry.content
	    end
	    feeds << Reader::feeds_push(title, date, category, description, author, nil)
	  end
	  return feeds
  end
end
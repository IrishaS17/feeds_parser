require_relative 'reader.rb'
require 'nokogiri'
require 'open-uri'

class IrishFeedParser
  include Reader
  
  def initialize url
    @content = read_content(url)
  end

  def read_content url
	  doc = open(url)
		content = doc.read
		parse_documnet = Nokogiri::HTML(content)
  end

  def irish_feed 
	  feeds = [] 
	  @content.css('article').each do |post| 
			title = post.at_css('.post-head').css('.title a').first.text
			date = post.at_css('.post-head small').text.split('|')
	    category = date[1].lstrip
	    date = date[0].rstrip
	    description = post.css('.post-preview').text
		  author = post.css('.post-author a').text
		  tags = post.css('.post-tags a').map { |tag| tag.text.strip }
		  
		  feeds << Reader::feeds_push(title, date, category, description, author, tags)
	  end
	  return feeds
	end
end
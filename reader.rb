module Reader 
  def Reader.feeds_push(title, date, category, description, author,  tags)
	  feeds = []
	  feeds.push( 
	    title: title,
	    date: date,
	    category: category,
	    description: description,
	    author: author,
	    tags: tags
	  )
  end
end
class WebpagesController < ApplicationController
	
	# Import two gems for web scrapping
	require 'open-uri'
	require 'nokogiri'

	def create
		# Here we will parse the webpage and scan for h1, h2, h3 and p

		# Check if the webpage has already been parsed
		webpage = Webpage.find_by_url(params['data']['attributes']['url'].to_s)
		if webpage != nil
			# Webpage been parsed before

			# Delete the webpage record
			webpage.destroy

			# Delete it's indexed content
			contents = Content.where(:webpage_id => webpage.id)
			contents.destroy_all
		end

		# Create the webpage record
		webpage = Webpage.new
		webpage.url = params['data']['attributes']['url'].to_s
		webpage.save

		# Grab and index it's content
		document = Nokogiri::HTML(open(webpage.url))

		# Get links and headers
		document.css('a[href]', 'h1', 'h2', 'h3').each do |link|
  			# puts link.name + ': ' + link.content
  			
  			# If it's a link, save the url, else the inner html of the header
  			if link.name == 'a'
  				data = link['href']
  			else
  				data = link.content
  			end

  			# Create new Content record
  			content = Content.new
  			content.webpage_id = webpage.id
  			content.wp_content_type = link.name
  			content.data = data
  			content.save

		end

		redirect_to '/'
	end
end

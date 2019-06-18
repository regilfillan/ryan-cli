exitrequire 'open-uri'
require 'nokogiri'
require 'pry'

class PodbayScraper
  
  BASE_URL= 'http://podbay.fm/browse/top'
  
  def self.scrape_podcasts
    page= Nokogiri::HTML(open(BASE_URL))
    podcasts = []
    full_cards= page.css('div.row ul.thumbnails')
    podcast_lis= full_cards.css('li.span3')
    podcast_lis.each do |li|
      title= li.css('div.caption h4').text.strip
      url= li.css('a')[0].attribute('href').value
      binding.pry
      Podcast.new(title, url)
    end
  end
  
  def self.scrape_description
    
  end
 
end

require 'open-uri'
require 'nokogiri'
require 'pry'

class PodbayScraper
  
  BASE_URL= 'http://podbay.fm/browse/top'
  
  def self.scrape_podcasts
    page= Nokogiri::HTML(open(BASE_URL))
    podcast_lis= page.css('ul.thumbnails li.span3 h4')
      
    binding.pry
  # titles = table.css('tr td span a')
  end
 
end

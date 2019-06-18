require 'open-uri'
require 'nokogiri'
require 'pry'

class PodbayScraper
  
  BASE_URL= 'http://podbay.fm/browse/top'
  
  def self.scrape_titles
    page= Nokogiri::HTML(open(BASE_URL))
    titles = page.css('ul.thumbnails li h4')
    binding.pry
  # titles = table.css('tr td span a')
  end
 
end

require 'open-uri'
require 'nokogiri'
require 'pry'

class StitcherScraper
  
  BASE_URL= 'https://www.stitcher.com/stitcher-list/all-podcasts-top-shows'
  
  def self.scrape_titles
    page= open(BASE_URL)
    binding.pry
    .css(“yyy”)
  end
 
end

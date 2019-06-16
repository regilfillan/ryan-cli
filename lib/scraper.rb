require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def get_page
    doc = Nokogiri::HTML(open("https://www.podcastinsights.com/top-us-podcasts/"))
  binding.pry
  end
  
  # def get_podcasts
  #   self.get_page.css(".class").css("p strong")
  # end
end
 
Scraper.new.get_page
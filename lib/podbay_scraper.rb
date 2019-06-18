require 'open-uri'
require 'nokogiri'
require 'pry'

class PodbayScraper
  
  BASE_URL= 'http://podbay.fm/browse/top'
  
  def self.scrape_podcasts
    page= Nokogiri::HTML(open(BASE_URL))
    podcast_lis= page.css('div.row ul.thumbnails li.span3 h4')
    podcast_lis.each do |li|
      title= li.css(‘div.caption h4’).text
      artist_or_network= li.css(‘div.caption h6’).text
      data_url= li.css(’a[href]’).each {|element|element[“href”]}
      binding.pry
  # titles = table.css('tr td span a')
  end
 
end

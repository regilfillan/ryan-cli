require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_directory_page(directory_url)
   directory_page= Nokogiri::HTML(open(directory_url))
   libraries = []
   directory_page.css("div.locations-list").each do |library|
     library.css(".location-information-row a").each do |location|
       location_overview_link = "#{location.attr('href')}"
       location_address = location.css(".location-address").text
       location_phone_number = location.css(".location-phone").text 
       location_email = location.css(".location_email")
       
  end

  def self.scrape_location_page(profile_slug)
    
  end
  
end
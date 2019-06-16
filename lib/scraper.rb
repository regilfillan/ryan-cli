require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_chart_page(chart_url)
   charts_page= Nokogiri::HTML(open(chart_url))
   binding.pry
   podcasts = []
   charts_page.css("div.locations-list").each 
     end
   end
   libraries
  end

  def self.scrape_location_page(profile_slug)
    location = {}
    location_info_page = Nokogiri::HTML(open(profile_slug))
    nav_menu = location_info_page.css(".location-subnav-list").children.css("a").map {|link| link.attribute("href").value}
    nav_menu.each do |subnav|
      if subnav.include?("about")
        location[:about]= link
      elsif subnav.include?("projects")
        location[:projects]= link 
      else subnav.include?("locations")
        location[:location_hours]= link
      end
    end
    location
  end
  
end
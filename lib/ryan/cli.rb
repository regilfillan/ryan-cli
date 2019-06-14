require_relative "../lib/scraper.rb"
require_relative "../lib/locations.rb"
require "nokogiri"
require "colorize"

class CommandLineInterface
  BASE_PATH = "bpl.bibliocommons.com/locations/list/"
  
  def run 
    make_locations
    add_attributes_to_locations
    display_locations
  end
  
  def make_locations
    locations_array = Scraper.scrape_directory_page(BASE_PATH + "index.html")
    Location.create_from_collection(locations_array)
  end
  
  def add_attributes_to_locations
    
  end
  
  def display_locations
    
  end
  
end
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
    
  end
  
  def add_attributes_to_locations
    
  end
  
  def display_locations
    
  end
  
end
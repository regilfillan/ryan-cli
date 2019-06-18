require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def get_page
    Nokogiri::HTML(open("https://www.stitcher.com/stitcher-list/all-podcasts-top-shows"))
  binding.pry
  end
  
  def get_podcasts
    self.get_page.css(“yyy”)
  end
 
  def make_podcasts
    self.get_podcasts.each do |pod|
      podcast = Podcast.new
      podcast.title = yyy.css(“xxx").text
      podcast.network_or_artist = yyy.css(“qqq”).text
      podcast.where_to_listen = yyy.css(“zzz”).text
    end
  end
 
  def print_podcasts
    self.make_podcasts
    Podcast.all.each do |pod|
      if podcast.title
        puts “Title: #{podcast.title}”
        puts ”  Network/Artist: #{podcast.network_or_artist}”
        puts ”  Where to Listen: #{podcast.where_to_listen}”
      end
    end
  end
 
end
 
Scraper.new.print_podcasts
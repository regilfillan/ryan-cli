require 'open-uri'
require 'nokogiri'
require 'pry'

class PodbayScraper

  BASE_URL= 'http://podbay.fm/browse/top'

  def self.scrape_podcasts
    page= Nokogiri::HTML(open(BASE_URL))
    podcasts = []
    full_cards= page.css('div.row ul.thumbnails')
    podcast_lis= full_cards.css('li.span3')[0..19]
    podcast_lis.each do |li|
      title= li.css('div.caption h4').text.strip
      url= li.css('a')[0].attribute('href').value
      Podcast.new(title, url)
    end
    Podcast.all
  end

  def self.scrape_details(podcast)
    url = podcast.url
    html = Nokogiri::HTML(open("http://podbay.fm" + url))
    details= html.css('div.well.sidebar-nav a')
    podcast.open_website= details[5].attribute('href').value
    podcast.read_reviews= details[2].attribute('href').value
    podcast.episode_list= details[0].attribute('href').value
    binding.pry
  end

end
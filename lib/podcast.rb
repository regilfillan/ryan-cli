class Podcast

  attr_reader :title, :url
  attr_accessor :open_website, :read_reviews, :episode_list

  @@all = []
 
  def initialize(title, url)
    @title= title
    @url= url
    @open_website = nil 
    @read_reviews = nil 
    @episode_list = nil
    @@all << self
  end
 
  def self.all
    @@all
  end
  
  def self.all_alph
     Podcast.all.sort {|a,b| a.title <=> b.title}
  end
  
end
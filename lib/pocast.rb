class Podcast

  attr_accessor :title, :network_or_artist, :where_to_listen

  @@all = []
 
  def initialize
    @@all << self
  end
 
  def self.all
    @@all
  end
  
end
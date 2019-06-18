class CommandLineInterface
  
  def run 
    welcome
    StitcherScraper.scrape_titles
    
  end
  
  def welcome
    puts "Welcome Message"
  end
  
  def list_top_podcasts
    
  end
  
end
class CommandLineInterface
  
  def run 
    welcome
    PodbayScraper.scrape_podcasts
    
  end
  
  def welcome
    puts "Welcome Message"
  end
  
  def list_top_podcasts
    
  end
  
end
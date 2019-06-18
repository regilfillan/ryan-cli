class CommandLineInterface
  
  def run 
    welcome
    PodbayScraper.scrape_titles
    
  end
  
  def welcome
    puts "Welcome Message"
  end
  
  def list_top_podcasts
    
  end
  
end
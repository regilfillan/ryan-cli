class CommandLineInterface
  
  def run 
    welcome
    PodbayScraper.scrape_podcasts
    loop do
      user_input = option_menu
        if user_input == "exit" || user_input.include?("n")
          return
        else
          self.list_podcasts
          self.choose_podcast
        end
  end
  
  def welcome
    puts "Welcome Message"
  end
  
  def option_menu
    puts "Would you like to see the Top 20 Podcasts today according to Podbay.fm? (Y/N)"
    input = gets.strip.downcase 
    
  end
  
  def list_top_podcasts
    puts "Today's Top 20:\n\n"
    Podcast.all.each_with_index {|pod, i| puts "#{i+1}. #{pod.title}"}
  end
  
  def choose_podcasts
    
  end
  
end
class CommandLineInterface
  
  def run 
    welcome
    PodbayScraper.scrape_podcasts
    loop do
      user_input = option_menu
        if user_input == "exit" || user_input.include?("n")
          return
        else
          self.list_top_podcasts
          self.choose_podcast
        end
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
    puts "Today's Top 20:\n\n\n"
    Podcast.all.each_with_index {|pod, i| puts "#{i+1}. #{pod.title}"}
  end
  
  def choose_podcasts
    puts "Select a Podcast Title or number from the list to learn more!"
    index = gets.strip.to_i-1
    podcast= Podcast.all[index]
    PodbayScraper.scrape_details(podcast)
    self.display_podcast_details(podcast)
  end
  
  def display_podcast_details
    puts "\n\n\n"
    puts podcast.title
    puts podcast.url 
    puts "\n\n\n"
  end
  
end
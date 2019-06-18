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
          user_input_again = self.choose_podcast
            # if user_input.is_a? Integer && 0 < user_input <= 19
            #   self.display_podcast_details
            # else
            #   puts "Oops! Please input a number between 1 and 20."
             # self.choose_podcast
            # end
        end
      end
    #
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
    puts "\n\n\n"
  end
  
  def choose_podcast
    puts "Select a number from the list to learn more about the corresponding Podcast!"
    index = gets.strip.to_i-1
    podcast= Podcast.all[index]
    PodbayScraper.scrape_details(podcast)
    self.display_podcast_details(podcast)
  end
  
  def display_podcast_details
    puts "\n\n\n"
    puts "Copy and paste the following to your URL to see the additional details!"
    puts "Open their website: '#{podcast.open_website}'!"
    puts "Read their reviews: '#{podcast.read_reviews}'!"
    puts "Check out their existing episodes: '#{podcast.episode_list}'!"
    puts "\n\n\n"
  end
  
end
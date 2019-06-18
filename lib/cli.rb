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
          user_input_again = gets.strip.to_i
            if user_input_again.is_a? Integer && (1 < user_input_again <= 20)
              self.display_podcast_details
            else
              puts "Oops! Please input a number between 1 and 20."
              self.choose_podcast
            end
        end
      end
  end

  def welcome
    puts "\n\n"
    puts "Welcome to the Top Twenty Podcast App!"
    puts "\n\n"
  end
  
  def salutation
    puts "\n\n"
    puts "Alrighty, have a nice day!"
    puts "\n\n"
  end
  
  def oops 
    puts "\n\n"
    puts "I'm sorry, I didn't understand that command. Let's try again."
    puts "\n\n"
  end

  def option_menu
    puts "Would you like to see today's Top 20 according to Podbay.fm? (Y/N)"
    puts "\n\n"
    input = gets.strip.downcase
  end

  def list_top_podcasts
    puts "Today's Top 20:\n\n"
    Podcast.all.each_with_index {|pod, i| puts "#{i+1}. #{pod.title}"}
    puts "\n\n"
  end

  def choose_podcast
    puts "Select a number from the list to learn more about the corresponding Podcast!"
    index = gets.strip.to_i-1
    podcast= Podcast.all[index]
    PodbayScraper.scrape_details(podcast)
    self.display_podcast_details(podcast)
  end

  def display_podcast_details(podcast)
    puts "\n\n"
    puts "Copy and paste the following to your URL to see the additional details!"
    puts "Open their website: '#{podcast.open_website}'!"
    puts "Read their reviews: '#{podcast.read_reviews}'!"
    puts "Check out their existing episodes: '#{podcast.episode_list}'!"
    puts "\n\n"
  end

end 
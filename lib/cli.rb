 class CommandLineInterface

  def run
    welcome
    PodbayScraper.scrape_podcasts
    option_menu
    menu_loop
  end

  def welcome
    puts "\n\n"
    puts "Welcome to the Top Twenty Podcast App!"
    puts "\n\n"
  end
  
  def salutation
    puts "\n\n"
    puts "Alrighty, have a nice day! To restart enter 'bin/run.rb'."
    puts "\n\n"
  end
  
  def oops 
    puts "\n\n"
    puts "I'm sorry, I didn't understand that command. Let's try again."
    puts "\n\n"
  end

  def self.menu_loop
    loop do
      user_input = option_menu
        if user_input == "exit" || user_input.include?("n")
          salutation
        elsif user_input.include?("y")
          self.list_top_podcasts
          self.choose_podcast
        else
          oops
          option_menu
        end
      end
  end 

  def option_menu
    puts "----"
    puts "Would you like to see today's Top 20 according to Podbay.fm? (Y/N)"
    puts "\n\n"
    input = gets.strip.downcase
  end

  def list_top_podcasts
    puts "----"
    puts "Today's Top 20:\n\n"
    Podcast.all.each_with_index {|pod, i| puts "#{i+1}. #{pod.title}"}
    puts "\n\n"
    puts "----"
  end

  def choose_podcast
    puts "\n\n"
    puts "Select a number from the list to learn more about the corresponding Podcast or enter 'exit' to return to menu."
    user_input= gets.strip.to_i
      if (1 < user_input <= 20)
        index = user_input-1
        podcast= Podcast.all[index]
        PodbayScraper.scrape_details(podcast)
        self.display_podcast_details(podcast)
      elsif user_input == "exit"
        option_menu
      else 
        oops
        self.choose_podcast
      end
  end

  def display_podcast_details(podcast)
    puts "\n\n"
    puts "Copy and paste the following to your URL to see the additional details:"
    puts "\n"
    puts "Open their website: '#{podcast.open_website}'!"
    puts "Read their reviews: '#{podcast.read_reviews}'!"
    puts "Check out their existing episodes: '#{podcast.episode_list}'!"
    puts "\n"
    puts "This is the final option of this podcast. If you'd like to return to the menu, please enter 'exit'."
    user_input= gets.strip.downcase
      if user_input == "exit"
        salutation
      else
        oops
        option_menu
      end
  end

end 
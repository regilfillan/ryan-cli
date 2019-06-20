 class CommandLineInterface

  def run
    welcome
    PodbayScraper.scrape_podcasts
    menu_loop
  end

  def welcome
    puts "\n"
    puts "Welcome to the Top Twenty Podcast App!"
    puts "\n"
  end
  
  def salutation
    puts "\n\n"
    puts "Alrighty, have a nice day!"
    puts "\n\n"
  end
  
  def oops 
    puts "I'm sorry, I didn't understand that command. Let's try again."
  end

  def menu_loop
    loop do
      user_input = option_menu
        if user_input == "exit" || user_input.include?("n")
          salutation
          break
        elsif user_input.include?("y")
          self.list_top_podcasts
          self.choose_podcast
        else
          oops
          menu_loop
        end
      end
  end 

  def option_menu
    puts "----"
    puts "Would you like to see today's real-time Top 20 podcasts according to iTunes charts? (Y/N)"
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
    puts "\n\n"
    loop do 
    user_input= gets.strip
    integer_input= user_input.to_i
      if user_input == "exit"
        salutation
        menu_loop
        break
      elsif (1..20).include?(integer_input)
        index = integer_input-1
        podcast= Podcast.all[index]
        PodbayScraper.scrape_details(podcast)
        self.display_podcast_details(podcast)
      else 
        oops
        menu_loop
      end
    end
  end

  def display_podcast_details(podcast)
    puts "----"
    puts "\n\n"
    puts "Copy and paste the following to your URL to see the additional details regarding your selected podcast:"
    puts "\n"
    puts "-Open their website: '#{podcast.open_website}'!"
    puts "\n"
    puts "-Read their reviews: '#{podcast.read_reviews}'!"
    puts "\n"
    puts "-Check out their existing episodes: '#{podcast.episode_list}'!"
    puts "\n"
    puts "-This is the final option of this podcast. If you'd like to return to the menu, please enter 'exit'."
    puts "\n"
    puts "----"
    user_input= gets.strip.downcase
      if user_input == "exit"
        salutation
        menu_loop
      else
        oops
        menu_loop
      end
  end

end 
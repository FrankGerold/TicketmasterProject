def user_menu_runner

  menu_selection = @prompt.select(%q'
  User Menu

  Select an Option
  ', ["Search for Event", "Find a Friend", "Logout"])

<<<<<<< HEAD

end



def user_menu_display
  puts "User Menu"
  puts ""
  puts "Select an Option"
  puts "1. Search for Event"
  puts "2. My List"
  puts "3. Find a Friend"
  puts "4. Logout"
end

def user_menu_choice (selection)
  if selection == "1"
    event_search

  elsif selection == "3"
    friend_search

  elsif selection == "4"
    log_out

  elsif selection == "2"
    puts "My Events"
    puts ""
    my_list

  else
    puts "Please select a valid option."
    user_menu_display
    user_menu_choice(user_prompt)

=======
  case menu_selection
  when "Search for Event"
    event_search_options
  when "Find a Friend"
    friend_search
  when "Logout"
    log_out
>>>>>>> Tristan
  end
end


def friend_search
  friend_input = @prompt.ask("What is your friend's username?")
  if friend_input == "exit"
    user_menu_runner
  else
    @friend = User.find_by(username: friend_input)
    if !@friend
      puts "Please try again, or type exit"
      friend_search
    else
      puts "We found your friend!"
      puts @friend.name
      puts ""
      friend_list
      #add friend event list logic here to print log_out
    end
  end
  user_menu_runner
end

def log_out
  main_menu_runner
end

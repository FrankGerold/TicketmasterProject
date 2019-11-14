def user_menu_runner

  user_menu_display

  user_menu_choice(user_prompt)


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

  end
end


def friend_search
  puts "What is your friend's username?"
  friend_username = user_prompt
  if friend_username == "exit"
    user_menu_runner
  else
    @friend = User.find_by(username: friend_username)
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

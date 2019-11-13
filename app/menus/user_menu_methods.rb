def user_menu_runner

  user_menu_display

  user_menu_choice(user_prompt)


end



def user_menu_display
  puts "User Menu"
  puts ""
  puts "Select an Option"
  puts "1. Search for Event"
  puts "2. Find a Friend"
  puts "3. Logout"
end

def user_menu_choice (selection)
  if selection == "1"
    event_search

  elsif selection == "2"
    friend_search

  elsif selection == "3"
    log_out

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
      #add friend event list logic here to print log_out
    end
  end
  user_menu_runner
end

def log_out
  main_menu_runner
end

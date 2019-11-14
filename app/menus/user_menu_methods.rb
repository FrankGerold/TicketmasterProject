def user_menu_runner

  menu_selection = @prompt.select(%q'
  User Menu

  Select an Option
  ', ["Search for Event", "My List", "Find a Friend", "Logout"])


  case menu_selection
  when "Search for Event"
    event_search_options
  when "Find a Friend"
    friend_search
  when "Logout"
    log_out
  when "My List"
    my_list
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

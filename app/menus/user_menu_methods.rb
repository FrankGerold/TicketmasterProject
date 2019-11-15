def user_menu_runner

  menu_selection = @prompt.select(%q'
  User Menu

  Select an Option
  ', ["Search for Event", "My Events", "Find a Friend", "My Friends", "Logout"])


  case menu_selection
  when "Search for Event"
    event_search_options
  when "Find a Friend"
    friend_search
  when "Logout"
    log_out
  when "My Events"
    my_list
  when "My Friends"
    my_friends
  end
end

def friend_search
  friend_input = @prompt.ask("What is your friend's username? Type 'exit' to go to the Main Menu.")
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
      add_friend(@friend)
      #add friend event list logic here to print log_out
    end
  end
end

def reload
  friend_id = @friend.id
  user_id = @user.id
  friendship_id = @friendship.id

  @friend = User.find(friend_id)
  @user = User.find(user_id)
  @friendship = Friendship.find(friendship_id)

end

def add_friend(friend)
  @friendship = Friendship.create(user_id: @user.id, friend_id: friend.id)
  user_menu_runner
end

def my_friends

    user_id = @user.id
    @user = User.find(user_id)

  friends_array =[]

  Friendship.all.each do |friendship|
     if friendship.user_id == @user.id
      friend_instance = User.find(friendship.friend_id)
      friends_array << friend_instance
    else friendship.friend_id == @user.id
      friend_instance = User.find(friendship.user_id)
      friends_array << friend_instance
    end
  end

  present_friend_list(friends_array.uniq)
end

def present_friend_list(friend_array)
  friend_names = friend_array.map { |friend| friend.name}
  selected_name = @prompt.select("Pick a friend.", friend_names << "Go back.")
  selected_friend = friend_array.find { |friend| friend.name  == selected_name }
  @friend = selected_friend
  selected_name == "Go back." ?  user_menu_runner : present_friend_events_array(friend_events)
end


def log_out
  main_menu_runner
end

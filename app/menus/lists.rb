

def friend_list

  friends = @friend.events

  present_events_array(friends)

end

def my_list

  user_list = @user.events

  present_events_array(user_list)

end

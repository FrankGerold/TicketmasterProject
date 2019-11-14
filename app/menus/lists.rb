def get_list (user_instance)
  list = user_instance.events
end


def friend_list

  local_user = @friend.id
  @friend = User.find(local_user)

  friends = get_list (@friend)

  present_events_array(friends)

end

def my_list
  local_user = @user.id
  @user = User.find(local_user)

  user_list = get_list (@user)

  user_events_array(user_list)

end


def user_events_array(events_array)
    event_names = events_array.map { |event| event.name }
    selected_event_name = @prompt.select('Pick an event.', event_names << "Go back.")
    selected_event = events_array.find { |event| event.name  == selected_event_name }
    selected_event_name == "Go back." ?  user_menu_runner : user_detailed_view(selected_event)
end

def user_detailed_view(event)
    puts "#{event["name"]} #{event["date"]} #{event["start_time"]} #{event["event_type"]}"
    option_select = @prompt.select("What do you want to do?", ["Delete Event", "Go Back"])
    case option_select
    when "Delete Event"
      user_event_list = @user.user_events
      dead_event = user_event_list.find do
          |dead_event|
          dead_event.event_id == event.id
        end
        dead_event.destroy
        local_user = @user.id
        @user = User.find(local_user)
        @user_list = get_list (@user)

        puts "Event deleted."
        user_menu_runner
    when "Go Back"
        user_events_array(Event.events)
    end
end

#
# def user_detailed_view(event)
#     puts "#{event["name"]} #{event["date"]} #{event["start_time"]} #{event["event_type"]}"
#
#     puts "What do you want to do?"
#     puts "1.) Delete Event"
#     puts "2.) Go Back"
#     detail_selection = user_prompt
#     user_detailed_menu(event, detail_selection)
# end

# def user_detailed_menu(event, selection)
#     if selection == "1"
#       user_event_list = @user.user_events
#       dead_event = user_event_list.find do
#         |dead_event|
#         dead_event.id == event.id
#       end
#
#       dead_event.destroy
#       local_user = @user.id
#       @user = User.find(local_user)
#       @user_list = get_list (@user)
#
#         user_events_array(@user_list)
#
#     elsif selection == "2"
#         user_events_array(@user_list)

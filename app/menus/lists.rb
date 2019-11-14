

def get_list (user_instance)

  list = user_instance.events

end

def friend_list

  friends = get_list (@friend)

  present_events_array(friends)

end

def my_list

  @user_list = get_list (@user)

  user_events_array(user_list)

end


def user_events_array(array)
    counter = 0
    exit_condition = counter + 1
    selection_hash = {}
    array.each do |event|
        counter += 1
        selection_hash[counter] = event
        puts "#{counter}.)   #{event["name"]} #{event["date"]} #{event["start_time"]} #{event["event_type"]}"
    end
    puts "#{counter + 1}.) Go Back To Previous Menu."
    puts "Which event would you like to choose?"
    event_selection = user_prompt
    if event_selection == exit_condition
        event_search
    elsif event_picked = selection_hash[event_selection.to_i]
        user_detailed_view(event_picked)
    else
        puts "Invalid Selection. Please Try Again."
        user_events_array(array)
    end
end

def user_detailed_view(event)
    puts "#{event["name"]} #{event["date"]} #{event["start_time"]} #{event["event_type"]}"

    puts "What do you want to do?"
    puts "1.) Delete Event"
    puts "2.) Go Back"
    detail_selection = user_prompt
    user_detailed_menu(event, detail_selection)
end

def user_detailed_menu(event, selection)
    if selection == "1"
      @user_event =
      @user_event.delete

        user_events_array(@user_list)

    elsif selection == "2"
        user_events_array(@user_list)
    else
        puts "Incorrect Selection. Please try again"
        user_detailed_view
    end
end

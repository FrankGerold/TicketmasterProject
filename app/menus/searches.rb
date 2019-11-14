
    def event_search
        events = Event.events
        puts "What State would you like to search in? Ex: 'NY'"
        location_input = user_prompt
        puts "What would you like to search by?"
        puts "1.) Keyword"
        puts "2.) Genre"
        search_type_input = user_prompt
        event_search_menu(search_type_input,location_input)
    end

    def event_search_menu(input,location)
        if input == "1"
            puts "Please input Keyword"
            keyword_input = user_prompt
            search_by_keyword(keyword_input, location)
        elsif input == "2"
            counter = 0
            events_hash = {}
            all_events = event_api_call(location)
            good_events = all_events.select do |event|
                event["classifications"][0]["genre"]  && event["classifications"][0]["genre"]["name"]
            end
            event_types = good_events.map { |event| event["classifications"][0]["genre"]["name"]}.uniq


            event_types.each do |e|
                counter += 1
                event = events_hash[counter] = e
                puts "#{counter}.)   #{e}"
            end
            puts "Which event genre are you interested in?"
            event_type_selection = user_prompt
            type_picked = events_hash[event_type_selection.to_i]
            sorted_events = all_events.select do |event|
                type_picked == event["classifications"][0]["genre"]["name"]
            end
            search_by_event_type(sorted_events)
        else
            puts "Incorrect Selection. Please Try Again"
            event_search
        end
    end

    def event_api_call(location)
        response = RestClient.get("https://app.ticketmaster.com/discovery/v2/events.json?stateCode=#{location}&size=20&sort=date,asc&apikey=yIOyaSRFXNnDOWUaFSGcLnMUePkdUpJG")
        events_hash = JSON.parse(response.body)
        events_array = events_hash["_embedded"]["events"]
        events_array
    end


    def search_by_keyword(keyword,location)
        events = Event.events
        response = RestClient.get("https://app.ticketmaster.com/discovery/v2/events.json?stateCode=#{location}&keyword=#{keyword}&size=3&sort=date,asc&apikey=yIOyaSRFXNnDOWUaFSGcLnMUePkdUpJG")
        events_hash = JSON.parse(response.body)
        if !events_hash["_embedded"]
          puts ""
          puts "Sorry, no results!"
          puts ""
          event_search

        else
        events_array = events_hash["_embedded"]["events"]

          events_array.each do |event|
              event_name = event["name"]
              event_type = event["classifications"][0]["genre"]["name"]
              event_date = event["dates"]["start"]["localDate"]
              event_time = event["dates"]["start"]["localTime"]
              event_url = event["url"]
              events << Event.new(name: event_name, state: "NY", date: event_date, event_type: event_type, url: event_url, start_time: event_time)
          end
          Event.events = events
          present_events_array(events)
        end

    end


    def present_events_array(array)
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
            event_detailed_view(event_picked)
        else
            puts "Invalid Selection. Please Try Again."
            present_events_array(array)
        end
    end

    def event_detailed_view(event)
        puts "#{event["name"]} #{event["date"]} #{event["start_time"]} #{event["event_type"]}"

        puts "What do you want to do?"
        puts "1.) Buy tickets and Save to my List"
        puts "2.) Go Back"
        detail_selection = user_prompt
        event_detailed_menu(event, detail_selection)
    end

    def event_detailed_menu(event, selection)
        if selection == "1"
            Launchy.open(event["url"])
            event.save
            @event = event
            @user_event = UserEvent.create(user_id: @user.id, event_id: event.id)


        elsif selection == "2"
            present_events_array(Event.events)
        else
            puts "Incorrect Selection. Please try again"
            event_detailed_view
        end
    end

    def search_by_event_type(array)
        events = Event.events = []
        array.each do |event|
            event_name = event["name"]
            event_type = event["classifications"][0]["genre"]["name"]
            event_date = event["dates"]["start"]["localDate"]
            event_time = event["dates"]["start"]["localTime"]
            event_url = event["url"]
            events << Event.new(name: event_name, state: "NY", date: event_date, event_type: event_type, url: event_url, start_time: event_time)
        end
        present_events_array(events)
    end

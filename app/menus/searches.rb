
    def event_search_options
        events = Event.events
        location_input = @prompt.ask("What State would you like to search in? Ex: 'NY'")
        search_type_input = @prompt.select("What would you like to search by?", ["Keyword", "Genre", "Surprise Me!", "Go back."])
        event_search_menu(search_type_input,location_input)
    end

    def event_search_menu(search_type,location)
        case search_type
        when "Keyword"
            keyword_input = @prompt.ask("Please input Keyword")
            keyword_array = keyword_api_call(keyword_input,location)
            search_results(keyword_array)
        when "Genre"
            genre_array = genre_filter(location)
            search_results(genre_array)
        when "Surprise Me!"

        when "Go back."
            user_menu_runner
        end
    end

    def genre_api_call(location)
        response = RestClient.get("https://app.ticketmaster.com/discovery/v2/events.json?stateCode=#{location}&size=20&sort=date,asc&apikey=yIOyaSRFXNnDOWUaFSGcLnMUePkdUpJG")
        events_hash = JSON.parse(response.body)
        events_array = events_hash["_embedded"]["events"]
        events_array
    end

    def keyword_api_call(keyword,location)
        response = RestClient.get("https://app.ticketmaster.com/discovery/v2/events.json?stateCode=#{location}&keyword=#{keyword}&size=3&sort=date,asc&apikey=yIOyaSRFXNnDOWUaFSGcLnMUePkdUpJG")
        events_hash = JSON.parse(response.body)
        events_array = events_hash["_embedded"]["events"]
        events_array
    end

    def genre_filter(state)
        all_events = genre_api_call(state)
        good_events = all_events.select{ |event| event["classifications"][0]["genre"] }
        event_types = good_events.map { |event| event["classifications"][0]["genre"]["name"]}.uniq
        genre_input = @prompt.select("Which event genre are you interested in?", event_types << "Go back.")
        if genre_input == "Go back."
            event_search_options
        else
        sorted_events = good_events.select { |event| genre_input == event["classifications"][0]["genre"]["name"] }
        end
    end

    def search_results(event_array)
        events = Event.events = []
        event_array.each do |event|
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


    def present_events_array(events_array)
        event_names = events_array.map { |event| event.name }
        selected_event_name = @prompt.select('Pick an event.', event_names << "Go back.")
        selected_event = events_array.find { |event| event.name  == selected_event_name }
        selected_event_name == "Go back." ?  event_search_options : event_detailed_view(selected_event)
    end

    def event_detailed_view(event)
        puts "#{event["name"]} #{event["date"]} #{event["start_time"]} #{event["event_type"]}"
        option_select = @prompt.select("What do you want to do?", ["Buy tickets and Save to my List", "Go Back"])
        case option_select
        when "Buy tickets and Save to my List"
            Launchy.open(event["url"])
            event.save

            UserEvent.create(user_id: @user.id, event_id: event.id)
            user_menu_runner
        when "Go Back"
            present_events_array(Event.events)
        end
    end


    def user_prompt
        STDIN.gets.chomp
    end

    def event_search_menu(input,location)
        if input == "1"
            puts "Please input Keyword"
            keyword_input = user_prompt
            search_by_keyword(keyword_input, location)
        elsif input == "2"
            puts "Placeholder"
        else
            puts "Incorrect Selection. Please Try Again"
        end
    end

    def event_search
        puts "What State would you like to search in? Ex: 'NY'"
        location_input = user_prompt
        puts "What would you like to search by?"
        search_type_input = user_prompt
        event_search_menu(search_type_input,location_input)
    end



    def search_by_keyword(keyword,location)
        events = Event.events = []
        response = RestClient.get("https://app.ticketmaster.com/discovery/v2/events.json?stateCode=#{location}&keyword=#{keyword}&size=3&sort=date,asc&apikey=yIOyaSRFXNnDOWUaFSGcLnMUePkdUpJG")
        events_hash = JSON.parse(response.body)
        events_array = events_hash["_embedded"]["events"]
        events_array.each do |event|
            event_name = event["name"]
            event_type = event["classifications"][0]["genre"]["name"]
            event_date = event["dates"]["start"]["localDate"]
            event_time = event["dates"]["start"]["localTime"]
            event_url = event["url"]
            events << Event.new(name: event_name, state: "NY", date: event_date, event_type: event_type, url: event_url, start_time: event_time)
        end
        present_events_array(events)

    end

    def present_events_array(array)
        counter = 0
        selection_hash = {}
        array.each do |event|
            counter += 1
            selection_hash[counter] = event
            puts "#{counter}.)   #{event["name"]} #{event["date"]} #{event["start_time"]} #{event["event_type"]}"
        end
        puts "Which event would you like to choose?"
        event_selection = user_prompt
        event_picked = selection_hash[event_selection.to_i]
        binding.pry
        event_detailed_view(event_picked)
    end

    def event_detailed_view(event)
        binding.pry
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
        elsif selection == "2"
            puts "State Placeholder"
        else
            puts "Incorrect Selection. Please try again"
            event_detailed_view
        end
    end

    def search_by_event_type(type,location)
        response =  RestClient.get('')
    end

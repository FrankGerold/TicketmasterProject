class EventApp
    def run
       response =  RestClient.get ('https://app.ticketmaster.com/discovery/v2/events.json?stateCode=NY&size=3&sort=date,asc&apikey=yIOyaSRFXNnDOWUaFSGcLnMUePkdUpJG') 
        events_hash = JSON.parse(response.body)
        events_array = events_hash["_embedded"]["events"]
        binding.pry
    end
end

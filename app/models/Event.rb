class Event < ActiveRecord::Base

    has_many :user_events
    has_many :users, through: :user_events
    @@events = []

#    def initialize(name: name, state: state, date: date,event_type: event_type, url: url, start_time: start_time)
#     @name = name
#     @state = state
#     @date = date
#     @event_type = event_type
#     @url = url
#     @start_time = start_time
#     @@events << self
#    end

    def self.events
        @@events
    end

    def self.events=(arg)
        @@events = arg
    end
end


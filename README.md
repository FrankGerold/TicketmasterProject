# TicketmasterProject

Name:
•    TBD  -

Description:
•    CLI Application that allows users to search for events using the Ticketmaster API. The users can then add and remove these event from their own personal list. Search for users to view their lists, and add those events to their own lists.
Features:
•    Ticketmaster Event Search
•    User Event Database
•    Find your friends in order to join them on the event
User Stories:
•    First time User
o    User starts app, and is greeted by splash screen. Splash screen is made up of name of app, “Login” option, “Create Account” option, and “Quit”. User selects “Create Account”. Prompt appears asking for the User’s name. User inputs name. Prompt asks for User’s location. User inputs location. Next prompt asks for desired username. User enters the username. App checks if it’s taken or not. If it’s available app asks for password. User inputs password. Main Menu appears. User scrolls to Log out. Apps takes user back to splash screen. User selects “Quit”.
•    User browses for event by Event Name
o    User starts app, and is greeted by splash screen. User selects login. App asks for Username. User Inputs Username. App asks for Password. User inputs password. Main menu appears. Main menu contains four options, “Search for Event”, “My List”, “Find Friend”, and “Log out”. User selects “Search for Event” option. Prompt asks for the State in which the User is looking for Events. Displays example of how to input the State. User inputs State. Search By menu is presented. It contains “Search By Name”, “Search By Event Type”. User selects “Search by Event Name”. User inputs Event name. List of Events populates and User can select which event they are going to and the app saves the event to their personal table list. 
•    User browses for event by Event Type
o    User starts app, and is greeted by splash screen. User selects login. App asks for Username. User Inputs Username. App asks for Password. User inputs password. Main menu appears. Main menu contains four options, “Search for Event”, “My List”, “Find Friend”, and “Log out”. User selects “Search for Event” option. Prompt asks for the State in which the User is looking for Events. Displays example of how to input the State. User inputs State. Search By menu is presented. It contains “Search By Event Name”, “Search By Event Type”. User selects “Search by Event Type”. App creates list of Event type from data parsed from API. User selects Event type List of Events populates and User can select which event they are going to and the app saves the event to their personal table list. 
•    Search for Friends Event List
o    User starts app, and is greeted by splash screen. User selects login. App asks for Username. User Inputs Username. App asks for Password. User inputs password. Main menu appears. Main menu contains four options, “Search for Event”, “My List”, “Find Friend”, and “Log out”. User selects Find Friend. Prompt appears asking for Friend’s name. User inputs name. Apps list Users by name, username and location. User selects friend. Friend’s list of Events appears. User can then select one of the friend’s events and then adds the event to their own list and opens a browser to the Ticketmaster website for the Event.

Resources:
•    Ticketmaster API
•    SQL
Model:
•    User
o    ID,Name, State, Username, Password
•    UserEvent
o    ID,User_ID, Event_ID
•    Event
o    ID, Name, State, Date, Type, URL
Schema:
•    users
o    id INTEGER PRIMARY KEY
o    name TEXT
o    state TEXT
o    username TEXT
o    password TEXT
•    user_events
o    id INTEGER PRIMARY KEY
o    user_ID INTEGER
o    event_ID INTEGER
•    events
o    id INTEGER PRIMARY KEY
o    name TEXT
o    state TEXT
o    date TEXT
o    type TEXT
o    url TEXT


Trello:



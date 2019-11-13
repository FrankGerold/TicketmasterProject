# class Menu
#
#   attr_reader :user, :username, :password

#Basic runner for the main menu, moving through login options
  def main_menu_runner

    splash

    login_menu_display
    login_prompt

  end





#Helper Methods below!

#splash screen that greets user on launch
  def splash
    puts " <<-SPLASH
      WELCOME TO THE TICKETMASTER SEARCHING EVENT CALENDAR APP
        ^REPLACE THIS WITH ACTUAL PROJECT NAME AND COOL ASCII LOGO STRING HEREDOC LATER
        SPLASH
      "
  end

  #General method for grabbing user inputs
  def user_prompt
    #user_input =
    STDIN.gets.chomp
  end

  #Menu options that pop up after splash screen
  def login_menu_display
    puts "Welcome to Ticket Search app!"
    puts "What would you like to do?"
    puts "1. Create Account"
    puts "2. Login"
    puts "3. Exit"
  end

  #Prompt user for their menu choice, move to next section or quit based on user choice
  def login_prompt
    menu_choice = user_prompt

    #go to login if user desires
    if menu_choice == "1"
      user_create

    elsif menu_choice == "2"
      account_login

    # Or quit
    elsif menu_choice == "3"
      exit

    #User should choose a valid option
    else
      puts "Sorry, incorrect option."
      login_menu_display
    end
  end

  #Method for starting the login process
  def account_login
    puts "Enter Username"

    #Grab username from user. "Find or Create" based on input.
    username_input = user_prompt
    @user = User.find_by(username: username_input)
    if !@user
      puts "Please try again"
      account_login
    else
      password_request
    #
    # #If the inputted user already has a name property, it existed beforehand.
    # if @user
    #   #Move on to ask user to verify password
    # #   password_request (user.password)
    # else
    #   #If user instance has no other properties, it is new and needs to be filled out.
    #   user_create
    end
  end

  #Menu option for creating new user
  def user_create
    # Users.destroy_all
    @user = User.new
    puts "What is your name?"
    name_input = user_prompt

    puts "What is your desired Username?"
    username_input = user_prompt

    puts "What is your location? example: \"NY\""
    location_input = user_prompt

    puts "What is your password?"
    password_input = user_prompt

    @user.name = name_input
    @user.state = location_input
    @user.password = password_input
    @user.username = username_input


    puts "Congratulations! You created an account!"
    @user.save
    @user
    user_menu_runner
    # Initialize user menu methods here


  end

  #start process to test password
  def password_request
    puts "Please enter your password."
    password_input = user_prompt
    if password_input == @user.password
      puts "Successful login!"
      @user
      user_menu_runner


      # Initialize user menu methods here

    #user can quit this process
    elsif password_input == "quit" || password_input == "exit"
      exit

    else
      #try again
      puts "Sorry, incorrect password. Try again."
      password_request
    end
  end

class Menu

  attr_reader :user, :username, :password

#Basic runner for the main menu

  def menu_runner

    splash

    login_menu_display
    login_prompt




  end

#Helper Methods below!

  def splash
    puts " <<-SPLASH
      WELCOME TO THE TICKETMASTER SEARCHING EVENT CALENDAR APP
        ^REPLACE THIS WITH ACTUAL PROJECT NAME AND COOL ASCII LOGO STRING HEREDOC LATER
        SPLASH
      "
  end

  def user_prompt
    puts ""
    user_input = gets.chomp
  end

  def account_login
    puts "Enter Username"
    username_input = user_prompt
    @user = User.find_or_create_by(username: username_input)

    if @user.name
      password_request
    else

  def login_menu_display
    puts "Welcome to Ticket Search app!"
    puts "What would you like to do?"
    puts "1. Create Account/Login"
    puts "2. Exit"
  end

    def login_prompt
      menu_choice = user_prompt

      if menu_choice = 1
        account_login

      elsif menu_choice = 2
        exit

      else
        puts "Sorry, incorrect option."
        login_menu
        
      end
    end






end

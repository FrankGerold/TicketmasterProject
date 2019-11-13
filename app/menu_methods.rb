class Menu

  attr_reader :user, :username, :password

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

  def login_menu
    puts "Welcome to Ticket Search app!"
    puts "What would you like to do?"
    puts "1. Create Account/Login"
    puts "2. Exit"
  end





end

# class Menu
#
#   attr_reader :user, :username, :password

#Basic runner for the main menu, moving through login options
  def main_menu_runner

    splash

    login_menu_display

  end





#Helper Methods below!

#splash screen that greets user on launch
  def splash
    puts <<-'SPLASH'


    _________  __  __   ______   _________   _______    ______
   /________/\/_/\/_/\ /_____/\ /________/\ /______/\  /_____/\
   \__.::.__\/\:\ \:\ \\::::_\/_\__.::.__\/ \::::__\/__\:::_ \ \
     /_\::\ \  \:\ \:\ \\:\/___/\  \::\ \    \:\ /____/\\:\ \ \ \
     \:.\::\ \  \:\ \:\ \\_::._\:\  \::\ \    \:\\_  _\/ \:\ \ \ \
      \: \  \ \  \:\_\:\ \ /____\:\  \::\ \    \:\_\ \ \  \:\_\ \ \
       \_____\/   \_____\/ \_____\/   \__\/     \_____\/   \_____\/


   JUST GO: The world's greatest social event planning calendar app.


   SPLASH
  end

  #General method for grabbing user inputs
  def user_prompt
    #user_input =
    STDIN.gets.chomp
  end

  #Menu options that pop up after splash screen

  def login_menu_display
    puts "Welcome to Ticket Search app!"
    login_choice = @prompt.select("What would you like to do?", ["Create Account", "Login", "Exit"])
    case login_choice
    when "Create Account"
      user_create
      system "clear"
    when "Login"
      account_login
      puts 'blah'
      system "clear"
    when "Exit"
      exit
    end
  end

  #Method for starting the login process
  def account_login
    #Grab username from user. "Find or Create" based on input.
    username_input = @prompt.ask("Enter Username, or exit.")
    @user = User.find_by(username: username_input)
    if !@user
      puts "Please try again"
      account_login
    elsif username_input == "quit" || username_input == "exit"
      exit
    else
      password_request
    end
  end

  #Menu option for creating new user
  def user_create
    # Users.destroy_all
    name_input = @prompt.ask("What is your name?")
    username_input = @prompt.ask("What is your desired Username?")
    location_input =  @prompt.ask("What is your location? example: \"NY\"")
    password_input = @prompt.ask("What is your password?")
    @user = User.create(name: name_input, state: location_input, password: password_input, username: username_input)
    puts "Congratulations! You created an account!"
    user_menu_runner
    # Initialize user menu methods here
  end

  #start process to test password
  def password_request
    password_input = @prompt.mask("Please enter your password, or type quit.")
    if password_input == @user.password
      puts "Successful login!"
      @user
      user_menu_runner
    #user can quit this process
    elsif password_input == "quit" || password_input == "exit"
      exit
    else
      #try again
      puts "Sorry, incorrect password. Try again." # add esscape option
      password_request
    end
  end

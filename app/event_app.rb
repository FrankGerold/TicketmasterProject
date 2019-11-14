class EventApp

<<<<<<< HEAD
  attr_reader :user, :friend, :event, :user_event, :user_list

=======
  attr_reader :user, :friend, :event, :user_event 
  
>>>>>>> Tristan
  def run
    @prompt = TTY::Prompt.new
    main_menu_runner
  end


end

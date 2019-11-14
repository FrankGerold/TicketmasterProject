class EventApp


  attr_reader :user, :friend, :event, :user_event

  def run
    @prompt = TTY::Prompt.new
    main_menu_runner
  end


end

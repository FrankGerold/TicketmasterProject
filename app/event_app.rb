class EventApp


  attr_reader :user, :friend, :event, :user_event, :friendship

  def run
    @prompt = TTY::Prompt.new
    main_menu_runner
  end


end

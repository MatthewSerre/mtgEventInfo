class MtgEventInfo::CLI
  
  def call
    list_events_by
    menu
    goodbye
  end
  
  def list_events_by
    puts <<-DOC
      Welcome to the command line interface for the Magic: The Gathering Event Information tool.
      1. Date
      2. Format
      3. Location
    DOC
  end
  
  def menu

    input = nil
    while input != "exit"
      puts "Please enter the number corresponding to the option by which you want to sort and display upcoming events."
      input = gets.strip.downcase
      case input
      when "1"
        puts "Lists all events in date order"
      when "2"
        puts <<-DOC
          1. Standard
          2. Limited
          3. Modern
          4. Legacy
        DOC
      when "3"
        puts ""
      end
    end
  end
  
  def goodbye
    puts "Thank you for using the Magic: The Gathering Event Information tool."
  end
end
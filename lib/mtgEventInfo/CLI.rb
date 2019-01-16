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
      puts "Please enter the number corresponding to the option by which you want to sort and display upcoming events or enter 'exit'."
      input = gets.strip.downcase
      case input
      when "1"
        puts "Lists all upcoming events in date order."
        @events = MtgEventInfo::Event.date
      when "2"
        puts <<-DOC
          Please enter the number corresponding to the format by which you want to sort and display upcoming events.
          1. Standard
          2. Limited
          3. Modern
          4. Legacy
          5. Team Constructed
        DOC
      when "3"
        puts "Please enter the number corresponding to the loction for which you would like to display upcoming events."
        puts "Lists alphabetically locations of all upcoming events."
      else
        puts "I did not understand your selection."
      end
    end
  end
  
  def goodbye
    puts "Thank you for using the Magic: The Gathering Event Information tool."
  end
end
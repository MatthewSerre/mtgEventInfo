class MtgEventInfo::CLI
  
  def call
    puts "Welcome to the command line interface for the Magic: The Gathering Event Information tool."
    list_events_by
    menu
    goodbye
  end
  
  def list_events_by
    puts <<-DOC
      1. Date
      2. Format
      3. Location
    DOC
    @events = MtgEventInfo::Event.all
  end
  
  def menu
    input = nil
    while input != "exit"
      puts "Please enter the number corresponding to the option by which you want to sort and display upcoming events or enter 'exit'."
      input = gets.strip.downcase
      case input
      when "1"
        date_events = @events
        date_events.each.with_index(1) do |event, i|
          puts "#{i}. #{event[:date]} - #{event[:name]} - #{event[:location]}"
        end
        date_input = nil
        while date_input != "back"
          puts "Please enter the number corresponding to the event about which you would like more information or enter 'back'."
          date_input = gets.strip.downcase
          if date_input.to_i > 0  && date_input.to_i <= @events.length
            puts ""
            puts "#{date_events[date_input.to_i-1][:location]} #{date_events[date_input.to_i-1][:mtgFormat]} #{date_events[date_input.to_i-1][:name]}"
              puts date_events[date_input.to_i-1][:date]
              puts "#{date_events[date_input.to_i-1][:moreInfoURL]}"
            puts ""
          elsif date_input.to_i > @events.length
            puts "Please enter a number from the list."
          elsif date_input == "back"
          
          else
            puts "I did not understand your selection."
          end
        end
      when "2"
        puts <<-DOC
          1. Standard
          2. Limited
          3. Modern
          4. Legacy
          5. Team Constructed
          Please enter the number corresponding to the format by which you want to sort and display upcoming events.
        DOC
          format_input= nil
          while format_input != "back"
            format_input = gets.strip.downcase
            format_events = @events
            case format_input
            when "1"
              puts "Upcoming Standard Events"
              i = 0
              format_events.each do |event|
                if event[:mtgFormat] === "Standard"
                  i+= 1
                  puts "#{i}. #{event[:date]} - #{event[:name]} - #{event[:location]}"
                end
              end
            end
          end
      when "3"
        @events.each.with_index(1) do |event, i|
          puts "#{i}. #{event[:location]}"
        end
        location_input = nil
        while location_input != "back"
          puts "Please enter the number corresponding to the loction for which you would like to display upcoming events or enter 'back' to return to the previous menu."
          location_input = gets.strip.downcase
          if location_input.to_i > 0  && location_input.to_i <= @events.length
            puts "Well done."
          elsif location_input.to_i > @events.length
            puts "Please enter a number from the list."
          elsif location_input === "back"
            menu
          else
            puts "I did not understand your selection."
          end
        end
      else
        puts "I did not understand your selection."
      end
    end
  end
  
  def goodbye
    puts "Thank you for using the Magic: The Gathering Event Information tool."
  end
end
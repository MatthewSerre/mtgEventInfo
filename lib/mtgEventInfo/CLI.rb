class MtgEventInfo::CLI
  
  def call
    puts "Welcome to Mox Ruby, a Magic: The Gathering Event Information tool."
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
  
  def list_events_by_date
    @events.each.with_index(1) do |event, i|
      puts "#{i}. #{event[:date]} - #{event[:name]} - #{event[:location]}"
    end
  end
  
  def submenu
    @events.each.with_index(1) do |event, i|
      puts "#{i}. #{event[:date]} - #{event[:name]} - #{event[:location]}"
    end
  end
  
  def menu
    
    input = nil
    while input != "exit"
      list_events_by
      puts "Please enter the number corresponding to the option by which you want to sort and display upcoming events or enter 'exit'."
      input = gets.strip.downcase
      
      case input
      when "1"
        list_events_by_date
        date_input = nil
        while date_input != "back"
          puts "Please enter the number corresponding to the event about which you would like more information or enter 'list' to see the list of events again or enter 'back' to return to the main menu."
          date_input = gets.strip.downcase
          if date_input.to_i > 0  && date_input.to_i <= @events.length
            puts ""
            puts "#{@events[date_input.to_i-1][:location]} #{@events[date_input.to_i-1][:mtgFormat]} #{@events[date_input.to_i-1][:name]}"
              puts @events[date_input.to_i-1][:date]
              puts "#{@events[date_input.to_i-1][:moreInfoURL]}"
            puts ""
          elsif date_input.to_i > @events.length
            puts "Please enter a number from the list."
          elsif date_input == "list"
            list_events_by_date
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
            format_input = gets.strip.downcase.to_i
            format_array = ["Standard","Limited","Modern","Legacy","Team Constructed"]
            format_events = @events
            puts "Upcoming #{format_array[format_input-1]} Events"
            i = 0
            format_events.each do |event|
              if event[:mtgFormat] === format_array[format_input-1]
                i+= 1
                puts "#{i}. #{event[:date]} - #{event[:name]} - #{event[:location]}"
              end
            end
          end
          
      when "3"
        @events.each.with_index(1) do |event, i|
          puts "#{i}. #{event[:location]}"
        end
        location_input = nil
        while location_input != "back"
          puts "Please enter the number corresponding to the location for which you would like to display upcoming events or enter 'back' to return to the previous menu."
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
    puts "Thank you for using Mox Ruby, a Magic: The Gathering Event Information tool."
  end
end
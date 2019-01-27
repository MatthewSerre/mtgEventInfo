class MtgEventInfo::CLI
  
  def call
    puts "Welcome to Mox Ruby, a tool for displaying and sorting information about upcoming Magic: The Gathering events."
    menu
    puts "Thank you for using Mox Ruby.  Good luck and have fun!"
  end
  
  def list_events_by
    puts <<-DOC
      1. Date
      2. Format
      3. Location
    DOC
    puts "Please enter the number corresponding to the option by which you want to sort and display upcoming events or enter 'exit'."
    @events = MtgEventInfo::Event.all
  end
  
  def list_events_by_date
    @events.each.with_index(1) do |event, i|
      puts "#{i}. #{event[:date]} - #{event[:TO]} #{event[:name]} - #{event[:location]}"
    end
  end
  
  def list_formats
    puts <<-DOC
      1. Standard
      2. Limited
      3. Modern
      4. Legacy
      5. Team Constructed
    DOC
    puts "Please enter the number corresponding to the format by which you want to sort and display upcoming events."
  end
  
  def list_events_by_format(format_array, format_input)
    @event_array = []
    i = 0
    puts "Upcoming #{format_array[format_input.to_i-1]} Events"
    @events.each do |event|
      if format_array[format_input.to_i-1] === event[:mtgFormat]
        i+=1
        puts "#{i}. #{event[:date]} - #{event[:TO]} #{event[:name]} - #{event[:location]}"
        @event_array.push(event)
      end
    end
  end
  
  def list_events_by_location
    @event_locations = []
    @events.each do |event|
      @event_locations.push("#{event[:location]}")
    end
    @event_locations.uniq!
    @event_locations.sort!
    @event_locations.each.with_index(1) do |event, i|
      puts "#{i}. #{event}"
    end
  end
  
  # def submenu
  #   @events.each.with_index(1) do |event, i|
  #     puts "#{i}. #{event[:date]} - #{event[:name]} - #{event[:location]}"
  #   end
  # end
  
  def menu
    
    input = nil
    while input != "exit"
      list_events_by
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
            puts "#{@events[:TO]} #{@events[date_input.to_i-1][:location]} #{@events[date_input.to_i-1][:mtgFormat]} #{@events[date_input.to_i-1][:name]}"
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
        list_formats
        format_input= nil
        while format_input != "back"
          format_input = gets.strip.downcase
          format_array = ["Standard","Limited","Modern","Legacy","Team Constructed"]

          if format_input.to_i > 0 && format_input.to_i <= format_array.length
            list_events_by_format(format_array, format_input)
            nested_input = nil
            while nested_input != "back"
              puts "Please enter the number corresponding to the event about which you would like more information or enter 'list' to see the list of events again or enter 'back' to return to the main menu."
              nested_input = gets.strip.downcase
              if nested_input.to_i > 0  && nested_input.to_i <= @event_array.length
                puts ""
                puts "#{@event_array[nested_input.to_i-1][:location]} #{@event_array[:TO]} #{@event_array[nested_input.to_i-1][:mtgFormat]} #{@event_array[nested_input.to_i-1][:name]}"
                puts @event_array[nested_input.to_i-1][:date]
                puts @event_array[nested_input.to_i-1][:moreInfoURL]
                puts ""
              elsif nested_input.to_i > @event_array.length
                puts "Please enter a number from the list."
              elsif nested_input == "list"
                list_events_by_format(format_array, format_input)
              elsif nested_input == "back"
              
              else
                puts "I did not understand your selection."
              end
            end
            
          elsif format_input.to_i > format_array.length
            puts "Please enter a number from the list."
          elsif format_input == "formats"
            list_formats
          elsif format_input == "back"
        
          else
            puts "I did not understand your selection."
          end
        end
          
      when "3"
        list_events_by_location
        location_input = nil
        while location_input != "back"
          puts "Please enter the number corresponding to the location for which you would like to display upcoming events or enter 'back' to return to the previous menu."
          location_input = gets.strip.downcase
          if location_input.to_i > 0  && location_input.to_i <= @event_locations.length
            puts ""
            puts "Upcoming Events in #{@event_locations[location_input.to_i-1]}"
            @events.each do |event|
              if event[:location] === @event_locations[location_input.to_i-1]
                puts ""
                puts "#{event[:TO]} #{event[:mtgFormat]} #{event[:name]}"
                puts "#{event[:date]}"
                puts "#{event[:moreInfoURL]}"
                puts ""
              end
            end
          elsif location_input.to_i > @events.length
            puts "Please enter a number from the list."
          elsif location_input === "list"
            list_events_by_location
          elsif location_input === "back"
            menu
          else
            puts "I did not understand your selection."
          end
        end
      
      when "exit"
        
      else
        puts "I did not understand your selection."
      end
      
    end
    
  end

end
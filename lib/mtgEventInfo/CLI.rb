class MtgEventInfo::CLI
  
  def call
    puts "Welcome to Mox Ruby, a tool for displaying and sorting information about upcoming Magic: The Gathering events."
    menu
    puts "Thank you for using Mox Ruby.  Good luck and have fun!"
  end

  def menu
    
    @input = nil
    while @input != "exit"
      list_events_by
      @input = gets.strip.downcase
      
      case @input
      when "1"
        list_events(1)
        sub_input = nil
        list_events_with_details(sub_input)
        
      when "2"
        list_events(2)
        sub_input = nil
        list_events_with_details(sub_input)
        # while format_input != "back"
        #   format_input = gets.strip.downcase
        #   if format_input.to_i > 0 && format_input.to_i <= format_array.length
        #     list_events_by_format(format_array, format_input)
        #     nested_input = nil
        #     while nested_input != "back"
        #       puts "Please enter the number corresponding to the event about which you would like more information or enter 'list' to see the list of events again or enter 'back' to return to the main menu."
        #       nested_input = gets.strip.downcase
        #       if nested_input.to_i > 0  && nested_input.to_i <= @event_array.length
        #         puts ""
        #         puts "#{@event_array[nested_input.to_i-1][:location]} #{@event_array[:TO]} #{@event_array[nested_input.to_i-1][:mtgFormat]} #{@event_array[nested_input.to_i-1][:name]}"
        #         puts @event_array[nested_input.to_i-1][:date]
        #         puts @event_array[nested_input.to_i-1][:moreInfoURL]
        #         puts ""
        #       elsif nested_input.to_i > @event_array.length
        #         puts "Please enter a number from the list."
        #       elsif nested_input == "list"
        #         list_events_by_format(format_array, format_input)
        #       elsif nested_input == "back"
              
        #       else
        #         puts "I did not understand your selection."
        #       end
        #     end
            
        #   elsif format_input.to_i > format_array.length
        #     puts "Please enter a number from the list."
        #   elsif format_input == "formats"
        #     list_formats
        #   elsif format_input == "back"
        
        #   else
        #     puts "I did not understand your selection."
        #   end
        # end
          
      when "3"
        list_events(3)
        sub_input = nil
        list_events_with_details(sub_input)
        
      when "exit"
        
      else
        puts "I did not understand your selection."
      end
      
    end
    
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
  
  def list_events(selection)
    
    if selection === 1
      @events.sort_by!{ |event| event[:date]}
      @events.each.with_index(1) do |event, i|
        puts "#{i}. #{event[:date]} - #{event[:TO]} #{event[:name]} - #{event[:location]}"
      end
      
    elsif selection === 2
      list_formats
      selection = nil
      while selection != "back"
        puts "Please enter the number corresponding to the format by which you want to sort and display upcoming events."
        selection = gets.strip.downcase
        if selection.to_i > 0  && selection.to_i <= @format_array.length
          i = 0
          @events.each.with_index do |event|
            if @format_array[selection.to_i-1] === event[:mtgFormat]
              i+=1
              puts "#{i}. #{event[:date]} - #{event[:TO]} #{event[:name]} - #{event[:location]}"
            end
          end
        elsif selection.to_i > @format_array.length
          puts "Please enter a number from the list."
        elsif selection == "list"
          list_events(@input.to_i)
        elsif selection == "back"
        
        else
          puts "I did not understand your selection."
        end
      end

    elsif selection === 3
      @events.uniq!{ |event| event[:location]}.sort_by!{ |event| event[:location]}
      @events.each.with_index(1) do |event, i|
        puts "#{i}. #{event[:location]}"
      end
    end
    
  end
  
  def list_events_with_details(selection)
    
    while selection != "back"
      puts "Please enter the number corresponding to the event about which you would like more information or enter 'list' to see the list of events again or enter 'back' to return to the main menu."
      selection = gets.strip.downcase
      if selection.to_i > 0  && selection.to_i <= @events.length
        @events.each do |event|
          if event[:location] === @events[selection.to_i-1][:location]
            puts ""
            puts "#{@events[selection.to_i-1][:TO]} #{@events[selection.to_i-1][:location]} #{@events[selection.to_i-1][:mtgFormat]} #{@events[selection.to_i-1][:name]}"
              puts @events[selection.to_i-1][:date]
              puts "#{@events[selection.to_i-1][:moreInfoURL]}"
            puts ""
          end
        end
      elsif selection.to_i > @events.length
        puts "Please enter a number from the list."
      elsif selection == "list"
        list_events(@input.to_i)
      elsif selection == "back"
      
      else
        puts "I did not understand your selection."
      end
    end
    
  end

  def list_formats
    @format_array = ["Standard","Limited","Modern","Legacy","Team Constructed"]
    i = 0
    puts ""
    @format_array.each_with_index do |mtgFormat|
      i+=1
      puts "#{i}. #{mtgFormat}"
    end
    puts ""
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

end
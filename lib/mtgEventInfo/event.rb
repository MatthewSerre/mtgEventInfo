class MtgEventInfo::Event
  
  attr_accessor :name, :location, :date, :registration_URL. :mtgFormat
  
  def self.date
    # I should return all upcoming events in chronological order.
    event_1 = self.new
    event_1.name = "SCG Open"
    event_1.location = "location"
    event_1.date = "1/11/11"
    event_1.registration_URL = "www.google.com"
    
    [event_1]
    # sorted by date
  end
  
  def self.location
    # I should return all upcoming events in chronological order.
    event_1 = self.new
    event_1.name = "SCG Open"
    event_1.location = "location"
    event_1.date = "1/11/11"
    event_1.registration_URL = "www.google.com"
    
    [event_1]
    # grouped and listed by location
  end
  
  def self.mtgFormat
    # I should return all upcoming events in chronological order.
    event_1 = self.new
    event_1.name = "SCG Open"
    event_1.location = "location"
    event_1.date = "1/11/11"
    event_1.registration_URL = "www.google.com"
    
    [event_1]
    # grouped and sorted by format
  end
  
end
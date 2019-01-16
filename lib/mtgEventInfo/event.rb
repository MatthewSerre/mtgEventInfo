class MtgEventInfo::Event
  
  attr_accessor :name, :location, :date, :registration_URL, :mtgFormat
  
  def self.all
    # The scraper should create a new event using the scraped data in the form of a hash and send the key value pairs to create an object with all these properties that can then be added to an array and iterated through and accessed from other methods looking for particular details to sort and display.
    
    # event_1 = self.new
    # event_1.name = "SCG Open"
    # event_1.date = "1/11/13"
    # event_1.mtgFormat = "Standard"
    # event_1.location = "location"
    # event_1.registration_URL = "www.google.com"
    
    # event_2 = self.new
    # event_2.name = "MagicFest"
    # event_2.date = "2/2/12"
    # event_2.mtgFormat = "Modern"
    # event_2.location = "another location"
    # event_2.registration_URL = "www.wizards.com"
    
    # [event_1, event_2]
    
    self.scrape_events
  end
  
  def self.scrape_events
    events = []
    
    events << self.scrape_wizards
    events << self.scrape_scg
    
    events
  end
  
  def self.scrape_wizards
    doc = Nokogiri::HTML(open("https://magic.wizards.com/en/content/premier-events-schedule#/overview"))
    name = doc.search("span.info ng-binding").text
    date = doc.search("h3.ng-binding").text
    binding.pry
  end
  
  def self.scrape_scg
    
  end

  
  # def self.date
  #   # I should return all upcoming events in chronological order.

    
  #   [event_1]
  #   # sorted by date
  # end
  
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
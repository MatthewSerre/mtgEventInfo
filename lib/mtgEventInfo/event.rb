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
    doc = Nokogiri::HTML(open("https://magic.wizards.com/en/content/premier-events-schedule#/list"))
    name = doc.search("div.socials").text
    date = doc.search("h3.ng-binding").text
    # span.info.ng-binding
  end
  
  def self.scrape_scg
    array = []
    html = open("http://www.starcitygames.com/content/schedule")
    doc = Nokogiri::HTML.parse(html)
    page_events = doc.css("div.event.os-event")
    page_events.each do |page_event|
      event = Hash.new
      event[:location] = doc.search("div.event-city").text
    end
    array
    binding.pry
  end
  
end
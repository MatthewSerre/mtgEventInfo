class MtgEventInfo::Event
  
  attr_accessor :name, :location, :date, :moreInfoURL, :mtgFormat
  
  def self.all
    self.scrape_events
  end
  
  def self.scrape_events
    @events = []
    
    # events << self.scrape_wizards
    self.scrape_scg
    
    @events
  end
  
  # def self.scrape_wizards
  #   doc = Nokogiri::HTML(open("https://magic.wizards.com/en/content/premier-events-schedule#/list"))
  #   name = doc.search("div.socials").text
  #   date = doc.search("h3.ng-binding").text
  #   # span.info.ng-binding
  # end
  
  def self.scrape_scg
    html = open("http://www.starcitygames.com/content/schedule")
    doc = Nokogiri::HTML.parse(html)
    page_events = doc.css("div.event.os-event")
    page_events.each do |page_event|
      event = Hash.new
      event[:name] = page_event.css("div.event-type").text
      event[:location] = page_event.css("div.event-city").text
      event[:date] = page_event["id"]
      event[:moreInfoURL] = page_event.css("div.event-title a")[0]["href"]
      event[:mtgFormat] = 
      @events.push(event)
    end
    # binding.pry
  end

end
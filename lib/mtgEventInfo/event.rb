class MtgEventInfo::Event
  
  attr_accessor :name, :location, :date, :moreInfoURL, :mtgFormat
  
  def self.all
    self.scrape_events
  end
  
  def self.scrape_events
    @events = []
    
    self.scrape_cfb
    self.scrape_scg
    
    @events
  end
  
  def self.scrape_cfb
    html = open("https://www.cfbevents.com/us-canada")
    doc = Nokogiri::HTML.parse(html)
    page_events = doc.css("div#comp-jmuqvt3rinlineContent-gridContainer")
    page_events.each do |page_event|
      event = Hash.new
      event[:name] = page_event.css("span").text
      # event[:location] = page_event.css("div.event-city").text
      # event[:date] = page_event["id"]
      # event[:moreInfoURL] = page_event.css("div.event-title a")[0]["href"]
      # event[:mtgFormat] = page_event.css("div.main-event div.format-box a").text
      # event[:TO] = "Channel Fireball"
      @events.push(event)
    end
    # binding.pry
  end
  
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
      event[:mtgFormat] = page_event.css("div.main-event div.format-box a").text
      event[:TO] = "Star City Games"
      @events.push(event)
    end
    # binding.pry
  end

end
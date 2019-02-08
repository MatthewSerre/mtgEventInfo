class MtgEventInfo::Scraper
    
  def self.scrape_scg
    html = open("http://www.starcitygames.com/content/schedule")
    doc = Nokogiri::HTML.parse(html)
    events = doc.css("div.event.os-event")
    events.each do |event|
      MtgEventInfo::Event.new(name=event.css("div.event-type").text,
      location=event.css("div.event-city").text,
      date=event["id"],
      moreInfoURL=event.css("div.event-title a")[0]["href"],
      mtgFormat=event.css("div.main-event div.format-box a").text,
      tournamentOrganizer="Star City Games")
    end
  end
  
end
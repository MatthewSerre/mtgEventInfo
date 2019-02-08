class MtgEventInfo::Scraper
    
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
      MtgEventInfo::Event.all.push(event)
    end
  end
  
end
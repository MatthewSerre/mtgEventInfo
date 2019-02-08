class MtgEventInfo::Event
  
  attr_accessor :name, :location, :date, :moreInfoURL, :mtgFormat
  
  @@all = []
  
  def self.all
    @@all
  end
  
end
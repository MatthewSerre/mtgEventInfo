class MtgEventInfo::Event
  
  attr_reader :name, :location, :date, :moreInfoURL, :mtgFormat, :tournamentOrganizer
  
  @@all = []
  
  def initialize(name=nil,location=nil,date=nil,moreInfoURL=nil,mtgFormat=nil,tournamentOrganizer=nil)
    @name = name
    @location = location
    @date = date
    @moreInfoURL = moreInfoURL
    @mtgFormat = mtgFormat
    @tournamentOrganizer = tournamentOrganizer
    
    @@all << self
  end
  
  def self.all
    @@all
  end
  
end
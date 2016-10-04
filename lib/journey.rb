class Journey

  attr_reader :entry_station

  def initialize
    @journey_history = []
  end

  def start(entry_station)
    @entry_station = entry_station
  end

  def reset_journey ###
     @entry_station = nil
  end

  def record_journey(station_out) ###
    @journey_history << {in: @entry_station, out: station_out}
    reset_journey
  end

  def in_journey?
    @entry_station == nil ? false : true
  end
end

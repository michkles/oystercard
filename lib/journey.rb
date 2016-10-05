class Journey

  PENALTY_FARE = 6

  attr_reader :fare, :entry_station

  def initialize(station)
    @fare = PENALTY_FARE
    @complete = false
    @entry_station = station[:name]
  end

  def complete?
    @complete
  end
end

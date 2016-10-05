class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :fare, :entry_station

  def initialize(station)
    @fare = PENALTY_FARE
    @complete = false
    @entry_station = station #[:name]
  end

  def complete?
    @complete
  end

  def finish(station)
    @exit_station = station
    calculate_fare
    self
  end

  def calculate_fare
    @complete = true
    @fare = MINIMUM_FARE
  end

end

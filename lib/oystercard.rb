class Oystercard



  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

attr_reader :balance, :entry_station, :exit_station, :in_journey
  def initialize
    @balance = 0
    @in_journey = false
    @journeys = []
  end


  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    fail 'Insufficient funds for jouney' if @balance < MINIMUM_BALANCE
    @in_journey = true
    @entry_station = station

  end

  def touch_out(station)
    @exit_station = station
    deduct(MINIMUM_BALANCE)
    journey
end



private

  def journey
    @journeys.push({@entry_station => @exit_station })
    @in_journey = false
  end

  def deduct(amount)
    @balance -= amount
  end



end

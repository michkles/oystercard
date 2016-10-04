require './lib/station.rb'
require './lib/journey.rb'

class Oystercard

  attr_reader :balance, :entry_station, :journey_history


  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize(balance = 0)
    @balance = balance
    @journey_history = []
  end

  def top_up(amount)
    fail "Maximum balance exceeded. Maximum balance allowed is #{MAXIMUM_BALANCE}" if amount > (MAXIMUM_BALANCE - balance)
    @balance += amount
  end

  def touch_in(station_name)
    fail "Insufficient funds to travel" if @balance < MINIMUM_FARE
    @entry_station = station_name
  end

  def touch_out(station_name)
    deduct(MINIMUM_FARE)
    record_journey(@entry_station, station_name)
    reset_journey
  end

  def in_journey?
    @entry_station == nil ? false : true
  end

  private

  def reset_journey
     @entry_station = nil
  end

  def record_journey(station_in, station_out)
    @journey_history << {in: station_in, out: station_out}
  end

  def deduct(amount)
    @balance -= amount
  end
end

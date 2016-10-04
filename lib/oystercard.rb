require './lib/station.rb'
require './lib/journey.rb'

class Oystercard

  attr_reader :balance


  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    fail "Maximum balance exceeded. Maximum balance allowed is #{MAXIMUM_BALANCE}" if amount > (MAXIMUM_BALANCE - balance)
    @balance += amount
  end

  def touch_in(station_name)
    fail "Insufficient funds to travel" if @balance < MINIMUM_FARE
    journey.start(station_name)
  end

  def touch_out(station_name)
    deduct(MINIMUM_FARE)
    journey.record_journey(station_name)
  end

  private

  def deduct(amount) ###
    @balance -= amount
  end
end

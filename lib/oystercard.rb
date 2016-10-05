require_relative 'station'
require_relative 'journey'

class Oystercard

  attr_reader :balance, :entry_station
  attr_accessor :journey

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(balance = 0)
    @balance = balance
    @journey = Journey.new
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
    journey.end(station_name)
    journey.record_journey
  end

  private

  def deduct(amount) ###
    @balance -= amount
  end
end

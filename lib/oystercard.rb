require_relative 'journey'
require_relative 'station'

class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance, :journeys

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    return false if @journey == nil else true
  end

  def touch_in(station)
    fail 'Insufficient funds for jouney' if @balance < MINIMUM_BALANCE
    @journey = Journey.new(station)
  end

  def touch_out(station)
    deduct(@journey.calculate_fare)
    @journeys << @journey.finish(station)
    @journey = nil
  end

  def touched_in?
    @journey.entry_station.!nil?
  end

private

  def deduct(amount)
    @balance -= amount
  end
end

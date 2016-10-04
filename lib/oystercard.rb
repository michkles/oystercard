require './lib/station.rb'

class Oystercard

  attr_reader :balance, :in_journey, :entry_station

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    fail "Maximum balance exceeded. Maximum balance allowed is #{MAXIMUM_BALANCE}" if amount > (MAXIMUM_BALANCE - balance)
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in(station_name)
    fail "Insufficient funds to travel" if @balance < MINIMUM_FARE
    @in_journey = true
    @entry_station = station_name
  end

  def touch_out
    @in_journey = false
    deduct(MINIMUM_FARE)
  end

  private

    def deduct(amount)
      @balance -= amount
    end
end

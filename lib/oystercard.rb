require './lib/station.rb'

class Oystercard

  attr_reader :balance, :entry_station

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    fail "Maximum balance exceeded. Maximum balance allowed is #{MAXIMUM_BALANCE}" if amount > (MAXIMUM_BALANCE - balance)
    @balance += amount
  end

  def in_journey?
    @entry_station == nil ? false : true
  end

  def touch_in(station_name)
    fail "Insufficient funds to travel" if @balance < MINIMUM_FARE
    @entry_station = station_name
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  private

    def deduct(amount)
      @balance -= amount
    end
end

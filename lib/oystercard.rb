class Oystercard

  attr_reader :balance, :in_journey

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

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "Insufficient funds to travel" if @balance - MINIMUM_FARE < 0
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end

class Oystercard
  attr_reader :balance, :journey

  BALANCE_LIMIT = 90
  MINIMUM_CREDIT = 1
  def initialize
    @journey = false
    @balance = 0
  end

  def top_up(value)
    fail "Balance limit of #{BALANCE_LIMIT} exceeded" if @balance + value > BALANCE_LIMIT
    @balance += value
  end

  def deduct(value)
   @balance -= value
  end

  def touch_in
    fail "Not enough credit" if balance < MINIMUM_CREDIT
    @journey = true
  end

  def touch_out
    @journey = false
  end

  def in_journey?
    @journey
  end



end

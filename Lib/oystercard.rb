require_relative 'station'

class Oystercard

attr_reader :balance

MAXIMUM_BALANCE = 90
MINIMUM_TOUCH_IN = 1

def initialize(balance = 0, maximum_balance = MAXIMUM_BALANCE, journey_log = JourneyLog.new)
  @balance = balance
  @maximum_balance = maximum_balance
  @journey_log = journey_log
end


  def top_up(amount)
    raise "Top Up above maximum" if balance_exceeded?(amount)
    @balance += amount
  end


  def touch_in(entry_station)
    raise "insufficient funds" if insufficient_touch_in?
    @journey_log.start_journey(entry_station)
  end

  def touch_out(exit_station)
    @journey_log.end_journey(exit_station)
    deduct(@journey_log.calc_fare_on_last)
  end


private

  def balance_exceeded?(amount)
    @maximum_balance < @balance + amount
  end

  def insufficient_touch_in?
    MINIMUM_TOUCH_IN > @balance
  end

  def deduct(amount)
    @balance -= amount
  end

end

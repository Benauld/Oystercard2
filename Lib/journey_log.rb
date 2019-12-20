require_relative 'journey'

class JourneyLog
  attr_reader :journey_log

  def initialize(journey_class)
    @journey_class = journey_class
    @journey_log = []
  end

  def in_journey?

    if @journey_log == []
      false
    else
      p "journey lon in in journey"
      p @journey_log
      !@journey_log.last.complete?
    end
  end

  def start_journey(entry_station)
    @journey_log << @journey_class.new(entry_station)

  end

  def end_journey(exit_station)
    if @journey_log == [] || @journey_log.last.complete?
      start_journey(nil)
    end
    @journey_log.last.end(exit_station)

  end

  def calc_fare_on_last
    @journey_log.last.calc_fare
  end

end

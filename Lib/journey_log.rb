require_relative 'journey'

class JourneyLog
  attr_reader :journey_log

  def initialize(journey_class)
    @journey_class = journey_class
    @journey_log = []
  end

  def in_journey?
    !!@entry_station
  end

  def start_journey(entry_station)
    p "creating new entry with entry station"
    @journey_log << @journey_class.new(entry_station)
    p @journey_log
  end

  def end_journey(exit_station)
    p "This is in end journey is journey log saying not complete?"
    p @journey_log.last.complete?
    if @journey_log = [] #|| @journey_log.last.complete?
      p "what are the elements of the or statement that takes me here?"
      p @journey_log
      p @journey_log.last.complete?
      start_journey(nil)
    end
    @journey_log.last.end(exit_station)
    p "are we blatting out the entry station here?"
    p @journey_log.last.end(exit_station)
  end

  def calc_fare_on_last
    @journey_log.last.calc_fare
  end

end

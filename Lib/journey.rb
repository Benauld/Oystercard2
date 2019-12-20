require_relative 'station'

class Journey
  attr_reader :entry_station, :exit_station

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station)
    @entry_station = entry_station
  end

  def end(exit_station)
    @exit_station = exit_station
    self
  end

  def calc_fare
    return ((@entry_station.zone - @exit_station.zone).abs +
      MINIMUM_FARE) if complete?
    PENALTY_FARE
  end

  def complete?
    !!@entry_station && !!@exit_station
  end


end

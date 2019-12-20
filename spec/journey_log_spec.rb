require 'journey_log'

describe JourneyLog do
  let(:entry_station){ double(:station) }
  let(:exit_station){ double(:station) }

  describe 'initialization' do
    it 'can create a new instantiated JourneyLog' do
      subject = JourneyLog.new(Journey)
      expect(subject).to be_an_instance_of JourneyLog
    end
  end

  describe '#start_journey' do
    it 'creates an instance of new journey' do
      subject = JourneyLog.new(Journey)
      expect(subject.start_journey(entry_station)).not_to be_empty
    end
  end

  describe '#end_journey' do
    it 'ends a journey when last journey has entry station and is passed exit station' do
      subject = JourneyLog.new(Journey)
      subject.start_journey(entry_station)
      expect(subject.end_journey(exit_station)).to eq subject.journey_log[0]
    end
  end

  it 'ends first journey if journey not started' do
    subject = JourneyLog.new(Journey)
    expect(subject.end_journey(exit_station)).to eq subject.journey_log[0]
  end

  it 'ends second journey if journey not started' do
    subject = JourneyLog.new(Journey)
    subject.start_journey(entry_station)
    subject.end_journey(exit_station)
    expect(subject.end_journey(exit_station)).to eq subject.journey_log[1]
  end

end

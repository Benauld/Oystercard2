require 'journey_log'

describe JourneyLog do
  let(:entry_station){ double(:station) }
  let(:exit_station){ double(:station) }

  describe 'initialization' do
    it 'can create a new instantiated JourneyLog' do
      expect(subject).to be_an_instance_of JourneyLog
    end
  end

  describe '#start_journey' do
    it 'creates an instance of new journey' do 
      subject = JourneyLog.new  
      expect(subject.start_journey(entry_station)).not_to be_empty
    end
  end



end
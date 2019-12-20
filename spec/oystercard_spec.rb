require 'oystercard'
require 'journey'

describe Oystercard do
  let(:entry_station) { double(:station) }
  let(:exit_station) { double(:station) }
  #let(:journey) { double(:journey), ::MINIMUM_FARE = 2 end returns "Kings Cross" }


  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it 'can top up the balance' do
    expect(subject.top_up(10)) .to eq(subject.balance)
  end

  it "cannot top-up beyond maximum balance" do
    expect { subject.top_up(Oystercard::MAXIMUM_BALANCE + 1) } .to raise_error "Top Up above maximum"
  end

  it "fails to allow touch in if insufficient funds" do
    expect { subject.touch_in(entry_station) } .to raise_error "insufficient funds"
  end

  # it "touch out reduces balance by 2 (minimum)" do
  #   subject.top_up(11)
  #   subject.touch_in(entry_station)
  #   expect { subject.touch_out(exit_station)} .to change {subject.balance }.by(journey::MINIMUM_FARE)
  # end

  it "touch out reduces balance by 6 (penalty)" do
    subject.top_up(11)
    expect { subject.touch_out(exit_station)} .to change {subject.balance }.by(-6)
  end

  it "records the entry station on touch in" do
    subject.top_up(11)
    subject.touch_in(entry_station)
    expect(subject.journey_log).to be_an_instance_of JourneyLog
  end

  it "records the exit station on touch out when no touch in" do
    subject.top_up(11)
    subject.touch_out(exit_station)
    expect(subject.journey_log).to be_an_instance_of JourneyLog

  end

end

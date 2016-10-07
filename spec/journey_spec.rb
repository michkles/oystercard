require 'spec_helper'

describe Journey do

  let(:card) {Oystercard.new(Oystercard::MINIMUM_FARE)}
  let(:station1) {double(:station, zone: 1)}
  let(:station2) {double(:station, zone: 1)}
  let(:entry_station) {double(:station, zone: 1)}
  let(:exit_station) {double(:station, zone: 3)}


  describe '#in_journey?' do
    it 'verifies that users is NOT in a journey' do
      expect(card.journey.in_journey).not_to be true
    end
  end

  it 'varifies that user is in journey after touching in' do
    card.touch_in(station1)
    expect(card.journey.in_journey).to be true
  end


  it 'varifies that user is not in journey after touching out' do
    card.touch_in(station1)
    card.touch_out(station2)
    expect(card.journey.in_journey).not_to be true
  end


  it "checks that the station argument in_touch in is the same as entry_station" do
    card.touch_in(station1)
    expect(card.journey.entry_station).to eq(station1)
  end

  it 'should charge a correct fare based on the zones travelled' do
    subject.start(entry_station)
    subject.end(exit_station)
    expect(subject.fare).to eq 3
  end

end

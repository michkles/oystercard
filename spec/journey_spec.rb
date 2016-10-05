require 'spec_helper'

describe Journey do

  let(:card) {Oystercard.new(Oystercard::MINIMUM_FARE)}
  let(:station1) {double(:station)}
  let(:station2) {double(:station)}

  describe '#in_journey?' do
    it 'verifies that users is NOT in a journey' do
      expect(subject).not_to be_in_journey
    end
  end

  it 'varifies that user is in journey after touching in' do
    card.touch_in(station1)
    expect(card).to be_in_journey
  end

end

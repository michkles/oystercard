require 'spec_helper'

describe Oystercard do

  let(:card) {Oystercard.new(Oystercard::MINIMUM_FARE)}

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do
    it 'can top up the balance' do
      expect { subject.top_up(Oystercard::MINIMUM_FARE) }.to change{ subject.balance }.by Oystercard::MINIMUM_FARE
    end

    it 'should raise error if maximum balance is exceeded' do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
      expect { subject.top_up(Oystercard::MINIMUM_FARE) }.to raise_error "Maximum balance exceeded. Maximum balance allowed is #{Oystercard::MAXIMUM_BALANCE}"
    end
  end

  describe '#in_journey?' do
    it 'verifies that users is NOT in a journey' do
      expect(subject).not_to be_in_journey
    end
  end

  describe '#touch_in' do
    it 'varifies that user is in journey after touching in' do
      card.touch_in(Station.new)
      expect(card).to be_in_journey
    end

    it "checks there is enough balance to pay for fare" do
        expect { subject.touch_in(Station.new) }.to raise_error "Insufficient funds to travel"
    end

    it "stores the location of the check in station on the card" do
      card.touch_in("Liverpool Street")
      expect(card.entry_station).to eq("Liverpool Street")
    end
  end

  describe '#touch_out' do
    it "verifies that a user is NOT in journey after touching out" do
      card.touch_in(Station.new)
      card.touch_out
      expect(card).not_to be_in_journey
    end

    it 'check that user has been charged for the journey on touch out' do
      card.touch_in(Station.new)
      expect { card.touch_out }.to change{ card.balance }.by(-1*Oystercard::MINIMUM_FARE)
    end
  end

end

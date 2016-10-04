require 'spec_helper'

describe Oystercard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do
    it 'can top up the balance' do
      expect { subject.top_up(10) }.to change{ subject.balance }.by 10
    end

    it 'should raise error if maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect { subject.top_up(1) }.to raise_error "Maximum balance exceeded. Maximum balance allowed is #{maximum_balance}"
    end
  end

  describe '#deduct' do
    it 'should deduct amount from balance' do
      subject.top_up(10)
      expect { subject.deduct(5) }.to change{ subject.balance }.by -5
    end
  end

  describe '#in_journey?' do
    it 'verifies that users is NOT in a journey' do
      expect(subject).not_to be_in_journey
    end
  end

  describe '#touch_in' do
    it 'varifies that user is in journey after touching in' do
      subject = Oystercard.new(10)
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it "checks there is enough balance to pay for fare" do
        expect { subject.touch_in }.to raise_error "Insufficient funds to travel"
    end
  end

  describe '#touch_out' do
    it "verifies that a user is NOT in journey after touching out" do
      subject = Oystercard.new(10)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end

end

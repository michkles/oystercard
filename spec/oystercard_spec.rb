require 'spec_helper'

describe Oystercard do

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it 'is not in a journey' do
    expect(subject).not_to be_in_journey
  end

  it 'can touch in' do
    subject.top_up(1)
    subject.touch_in
    expect(subject).to be_in_journey
  end

describe '#touch_out' do

  before :each do
    subject.top_up(1)
    subject.touch_in
  end
  it 'can touch out' do
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it 'deducts the correct money after the journey' do
    expect { subject.touch_out }.to change { subject.balance }.by (-Oystercard::MINIMUM_BALANCE)
  end

end

  it "won't touch in if below minimum balance" do
    expect{subject.touch_in}.to raise_error 'Insufficient funds for jouney'
  end

  describe 'top_up' do
    before :each do
      @balance = Oystercard::MAXIMUM_BALANCE
    end
    it 'can top up the balance' do
      expect{subject.top_up(1)}.to change{subject.balance}.by 1
    end

    it 'raises an exception if maximum balance is exceeded' do
      subject.top_up(@balance)
      expect{subject.top_up 5}.to raise_error "Maximum balance of #{Oystercard::MAXIMUM_BALANCE} exceeded"
    end
  end

  describe '#deduct' do
    it 'deducts an amount from the balance' do
      subject.top_up(10)
      expect{subject.deduct 5}.to change{subject.balance}.by -5
    end
  end

end

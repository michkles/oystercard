require 'spec_helper'

describe Oystercard do

  let(:card) {Oystercard.new(Oystercard::MINIMUM_FARE)}
  let(:station1) {double(:station)}
  let(:station2) {double(:station)}

  describe '#initialize' do

    it 'has a balance of zero' do
      expect(subject.balance).to eq(0)
    end
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


  describe '#touch_in' do

    it "checks there is enough balance to pay for fare" do
        expect { subject.touch_in(station1) }.to raise_error "Insufficient funds to travel"
    end
  end


  describe '#touch_out' do

    it 'check that user has been deducted for the journey on touch out' do
      card.touch_in(station1)
      expect { card.touch_out(station2) }.to change{ card.balance }.by(-Oystercard::MINIMUM_FARE)
    end
  end


#  describe '#penalty' do
#
#    it 'when touching_in twice without out in between deduct penalty fare' do
#      card.touch_in(station1)
#      expect(card.touch_in(station1)).to change{card.balance}.by Oystercard::PEN_FARE
#    end

#  end


end

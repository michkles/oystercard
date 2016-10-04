require 'oystercard'

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
      expect(subject.in_journey?).to eq false
    end
  end

  describe '#touch_in' do
    it '' do
      subject.touch_in
      expect(subject.in_journey?).to eq true
    end
  end

end

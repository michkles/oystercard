require 'journey'
require 'station'

describe Journey do

  let(:station) { double :station, zone: 1 }
  subject {Journey.new(station)}

  describe 'Initialization' do
    it 'has a default penalty fare' do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end
    it 'sets journey as incomplete' do
      expect(subject).not_to be_complete
    end
  end

  it 'returns a journey when finished' do
   expect(subject.finish(station)).to eq subject
 end

  context 'given an entry station' do

    it 'has an entry station' do
      expect(subject.entry_station).to eq station
    end

    context 'given an exit station' do
      let(:station2) { double :station2}

      before do
        subject.finish(station2)
      end

      it 'calculates a fare' do
        expect(subject.calculate_fare).to eq 1
      end

      it 'knows that a journey is complete' do
        expect(subject).to be_complete
      end
    end
  end




end

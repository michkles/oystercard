require 'journey'
require 'station'

describe Journey do
  let(:station) { double :station, zone: 1 }

  # let (:station) { Station.new(:tadas, 1)}

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
    subject {Journey.new(name: station)}

    it 'has an entry station' do
      # allow(station).to receive(:name).and_return(:tadas)
      p station
      p subject
      expect(subject.entry_station).to eq station
    end
    it 'returns a penalty fare if no entry station' do

    end
  end

  #
  # let (:station1) { double(:tadas)}
  # let (:station2) { double(:frances)}
  #
  # describe '#finish' do
  #   it 'returns a journey' do
  #     expect(subject.finish(station))to eq subject
  #   end
  # end
end

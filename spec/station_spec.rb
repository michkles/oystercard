require 'station'

describe Station do

subject {Station.new('tadas', 1)}

  it 'sets a zone' do
    expect(subject.zone).to eq 1
  end

  it 'sets a name' do
    expect(subject.name).to eq 'tadas'
  end

end

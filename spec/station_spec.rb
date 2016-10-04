require 'spec_helper'

describe Station do

  let(:station) {Station.new("King's Cross", 1)}

  it "return station's name" do
    expect(station.name).to eq("King's Cross")
  end

  it "return station's zone" do
    expect(station.zone).to eq(1)
  end

end

require 'spec_helper'

describe Station do
	it 'initializes a instance of a station' do
		test_station = Station.new(:name => "A")
		expect(test_station).to be_an_instance_of Station
	end

	it 'starts as an empty array' do #self.all
		test_station= Station.new({:name => "A"})
		expect(Station.all).to eq []
	end
end
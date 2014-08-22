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

	it 'allows user to add a station into the stations table' do
	test_station = Station.new({:name => "A"})
	test_station.add
	expect(Station.all).to eq [test_station]
	end

	it 'will recognize 2 stationss with the same name as different' do
		test_station = Station.new({:name => "A"})
		test_station2 = Station.new({:name => "A"})
		test_station.add
		test_station2.add
		expect(test_station).to eq test_station2
	end
end
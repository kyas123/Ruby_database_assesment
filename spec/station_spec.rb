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

	it 'will recognize 2 stations with the same name as different' do
		test_station = Station.new({:name => "A"})
		test_station2 = Station.new({:name => "A"})
		test_station.add
		test_station2.add
		expect(test_station).to eq test_station2
	end

	it 'gives an id to a station when added' do
		test_station = Station.new({:name => "A"})
		test_station.add
		expect(test_station.id).to be_an_instance_of Fixnum
	end

	it 'returns all lines that connect to a station' do
		test_station = Station.new({:name => "A"})
    test_line = Line.new ({:name => "Green"})
    test_station.add
    test_line.add
    test_stop = Stop.new({:station_id => test_station.id, :line_id => test_line.id})
    test_stop.add

    test_line2 = Line.new ({:name => "Black"})
    test_line2.add
		test_stop2 = Stop.new({:station_id => test_station.id, :line_id => test_line2.id})
    test_stop2.add
    expect(test_station.stops).to eq [test_line, test_line2]
  end
end
require 'spec_helper'

describe Stop do

	it 'initializes a stop with a line and station' do
		test_line = Line.new({:name => "Green"})
		test_station = Station.new({:name => "A"})
		test_stop = Stop.new({:station_id => test_station.id, :line_id => test_line.id})
		expect(test_stop).to be_an_instance_of Stop
	end

	it 'shows the initialized line and station' do
		test_line = Line.new({:name => "Green"})
		test_station = Station.new({:name => "A"})
		test_stop = Stop.new({:station_id => test_station.id, :line_id => test_line.id})
		expect(test_stop.station_id).to eq test_stop.station_id
		expect(test_stop.line_id).to eq test_stop.line_id
	end

	it 'starts as an empty array' do
		expect(Stop.all).to eq []
	end

	it '2 stops with the same name recognized' do
		test_line = Line.new(:name => "Green")
    test_station = Station.new(:name => "A")
		test_stop = Stop.new({:station_id => test_station.id, :line_id => test_line.id})
		test_stop2 = Stop.new({:station_id => test_station.id, :line_id => test_line.id})
		expect(test_stop).to eq test_stop2
	end

	it 'gives an id to stop when saved' do
		test_line = Line.new({:name => "Green"})
		test_station = Station.new({:name => "A"})
		test_stop = Stop.new({:station_id => test_station.id, :line_id => test_line.id})
		expect(test_stop.id).to be_an_instance_of Fixnum
	end



end
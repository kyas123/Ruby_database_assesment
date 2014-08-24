require 'spec_helper'

describe Line do

	it 'initializes a instance of a station' do #initialize
		test_line = Line.new(:name => "Green")
		expect(test_line).to be_an_instance_of Line
	end

	it 'starts as an empty array' do #self.all
		test_line = Line.new({:name => "Green"})
		expect(Line.all).to eq []
	end

	it 'allows user to add a line to lines table' do #add
		test_line = Line.new({:name => "Green"})
		test_line.add
		expect(Line.all).to eq [test_line]
	end

	it 'recognizes two lines with the same name as different' do # ==
		test_line = Line.new({:name => "Green"})
		test_line2 = Line.new({:name => "Green"})
		test_line.add
		test_line2.add
		expect(test_line).to eq test_line2
	end

	it 'gives an id to the line after being saved' do
		test_line = Line.new({:name => "Green"})
		test_line.add
		expect(test_line.id). to be_an_instance_of Fixnum
	end

	it 'returns all stations on a line' do

		test_station = Station.new({:name => "A"})
    test_line = Line.new ({:name => "Green"})
    test_station.add
    test_line.add
    test_stop = Stop.new({:station_id => test_station.id, :line_id => test_line.id})
    test_stop.add

		test_station2 = Station.new ({:name => "B"})
    test_station2.add
    test_stop2 = Stop.new({:station_id => test_station2.id, :line_id => test_line.id})
    test_stop2.add
    expect(test_line.stops).to eq [test_station, test_station2]
  end

end
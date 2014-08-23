require 'spec_helper'

describe Stop do
	
	it 'initializes a stop with a line and station' do
	test_line = Line.new({:name => "Green"})
	test_station = Station.new({:name => "A"})
	test_stop = Stop.new({:station_id => test_station.id, :line_id => test_line.id})
	expect(test_stop).to be_an_instance_of Stop
	end

end
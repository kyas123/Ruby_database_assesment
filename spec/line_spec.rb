require 'spec_helper'

describe Line do
	it 'initializes a instance of a station' do
		test_line = Line.new(:name => "Green")
		expect(test_line).to be_an_instance_of Line
	end

	it 'starts as an empty array' do
		test_line = Line.new({:name => "Green"})
		expect(Line.all).to eq []
	end
end
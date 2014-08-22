require 'spec_helper'

describe Line do

	it 'initializes a instance of a station' do
		test_line = Line.new(:name => "Green")
		expect(test_line).to be_an_instance_of Line
	end

	it 'starts as an empty array' do #self.all
		test_line = Line.new({:name => "Green"})
		expect(Line.all).to eq []
	end

	it 'allows user to add a line to lines table' do 
		test_line = Line.new({:name => "Green"})
		test_line.add
		expect(Line.all).to eq [test_line]
	end

	it 'recognizes two lines with the same name as different' do
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
	
end
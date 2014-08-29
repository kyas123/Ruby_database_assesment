require 'pg'
require './lib/line'
require './lib/station'
require './lib/stop'

DB =PG.connect({:dbname => 'test_train'})

def main_menu 
	loop do
		puts "***TRAIN STATION ***"
		puts "Press '1' to create a line"
		puts "Press '2' to list all lines"
		puts "Press '3' to add a stop"
		puts "Press '4' to list all stations"
		puts "Press '5' to list all stops"
		puts "Press 'x' to exit the program"

		input_choice = gets.chomp

		if input_choice == '1'
			add_line
		elsif input_choice == '2'
			list_lines
		elsif input_choice == '3'
			add_stations
		elsif input_choice == '4'
			list_stations
		elsif input_choice == '5'
			list_stops
		elsif input_choice == 'x'
			puts "***Good-bye***"
			system 'clear'
			sleep(0.5)
			exit
			else 
				puts "Not a valid entry,try again."
				main_menu
		end
	end
end


def add_line
	puts "Enter your line:\n\n"
	line_input = gets.chomp
	new_line = Line.new({:name => line_input})
	new_line.add
	puts "#{new_line.name} has been saved to your lines.\n\n"
end

def list_stops
	puts "Here are all your stops\n\n"
	Stop.all.each do |listed_stop|
		puts "#{listed_stop.line_id}, #{listed_stop.station_id}"
	end
end
	

def list_lines
	puts "Here are all your lines\n\n"
	Line.all.each { |line| puts line.name}
end


def add_stations
	list_lines
	puts "Type which line you'd like to add a station on."
	line = Line.find(gets.chomp)
	puts "Name your station for the selected line:"
	station_input = gets.chomp
	station = Station.new(:name => station_input)
	station.add
	line.add_station(station.id)
end



def list_stations
	puts " heres ya stations:"
	Station.all.each { |station| puts station.name}
end




main_menu
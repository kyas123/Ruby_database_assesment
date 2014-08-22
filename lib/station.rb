class Station

	attr_reader :name

	def initialize(attributes)
		@name = attributes[:name]
	end

	def self.all
		station_array = []
		results = DB.exec("SELECT * FROM stations;")
		results.each do |result|	
			attributes = ({:name => result['name']})
			current_station = Station.new(attributes)
			station_array << current_station
		end
		station_array
	end

	def add
		results = DB.exec("INSERT INTO stations (name) VALUES ('#{name}');")
	end

	def ==(another_station)
		self.name == another_station.name
	end

	


end
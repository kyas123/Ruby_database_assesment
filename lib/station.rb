class Station

	attr_reader :name, :id

	def initialize(attributes)
		@name = attributes[:name]
		@id = attributes[:id].to_i
	end

	def self.all
		station_array = []
		results = DB.exec("SELECT * FROM stations;")
		results.each do |result|	
			attributes = ({:name => result['name'], :id => result['id']})
			current_station = Station.new(attributes)
			station_array << current_station
		end
		station_array
	end

	def add
		results = DB.exec("INSERT INTO stations (name) VALUES ('#{name}') RETURNING id;")
		@id = results.first['id'].to_i
	end

	def ==(another_station)
		(self.name == another_station.name) 
	end

	


end
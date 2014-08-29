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

	 def stops
    lines = []
    results = DB.exec("SELECT lines.* FROM stations JOIN stops ON (stations.id = stops.station_id) JOIN lines ON (stops.line_id = lines.id) WHERE stations.id = #{@id};")
    results.each do |result|
      name = result['name']
      id = result['id'].to_i
      lines << Line.new(:name => result['name'], :id => result['id'])
    end
    lines
  end

  	def add_line(line_input)
    DB.exec("INSERT INTO stops (station_id, line_id) VALUES ('#{self.id}', '#{input_line_id}');")
  	end

   def self.find(station_entry)
  	station =[]
  	results = DB.exec("SELECT * FROM stations WHERE name = '#{station_entry}';")
  	results.each do |result|
  		station << Station.new(:name => result['name'], :id => result['id'])
  	end
  	station.first
  end

end
	

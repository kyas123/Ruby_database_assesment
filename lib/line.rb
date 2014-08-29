class Line

	attr_reader :name, :id

	def initialize(attributes)
		@name = attributes[:name]
		@id = attributes[:id].to_i
	end

	def self.all
		lines_array = []
		results = DB.exec("SELECT * FROM lines;")
		results.each do |result|
		attributes = {:name => result['name'], :id => result["id"]}
		current_line = Line.new(attributes)
	  lines_array << current_line
		end
		lines_array
	end

	def add
		results = DB.exec("INSERT INTO lines (name) VALUES ('#{@name}') RETURNING id;")
		@id = results.first['id'].to_i
	end

	def ==(another_line)
		self.name == another_line.name
	end

	 def stops
    stations = []
    results = DB.exec("SELECT stations.* FROM lines JOIN stops ON (lines.id = stops.line_id) JOIN stations ON (stations.id = stops.station_id) WHERE lines.id = #{@id};")
    results.each do |result|
     name = result['name']
     id = result['id'].to_i
     stations << Station.new(:name => result['name'], :id => result['id'])
    end
    stations
  end

  def add_station(station_input)
  	DB.exec("INSERT INTO stops (station_id,line_id) VALUES (#{station_input}, #{self.id})")
  end

  def self.find(line_entry)
  	line =[]
  	results = DB.exec("SELECT * FROM lines WHERE name = '#{line_entry}';")
	  results.each do |result|
	  	line << Line.new(:name => result['name'], :id => result['id'])
	  end
  	line.first
  end
end
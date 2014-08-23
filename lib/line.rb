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

	def ==(another_stop)
		self.name == another_stop.name
		
	end


end
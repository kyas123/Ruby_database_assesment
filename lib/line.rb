class Line

	attr_reader :name

	def initialize(attributes)
		@name = attributes[:name]
	end

	def self.all
		lines_array = []
		results = DB.exec("SELECT * FROM lines;")
		results.each do |result|
			attributes = {:name => result['name']}
			 current_line = Line.new(attributes)
			 lines_array << current_line
		end
		lines_array
	end


end
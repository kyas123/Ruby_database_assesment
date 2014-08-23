class Stop
	attr_reader :line_id , :station_id , :id

	def initialize(attributes)
		@line_id = attributes[:line_id].to_i
		@station_id = attributes[:station_id].to_i
		@id = attributes [:id].to_i
	end

	def self.all
		stops = []
		results = DB.exec("SELECT * FROM stops;")
			results.each do |result|
				attributes = {:station_id => result['station_id'],
						:line_id => result['line_id'],
						:id => result['id']}
					current_stop = Stop.new(attributes)
					stops << current_stop
				end
				stops
			end


	end

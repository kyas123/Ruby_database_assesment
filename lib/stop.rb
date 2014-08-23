class Stop
	attr_reader :line_id , :station_id , :id

	def initialize(attributes)
		@line_id = attributes[:line_id].to_i
		@station_id = attributes[:station_id].to_i
		@id = attributes [:id].to_i
	end






end
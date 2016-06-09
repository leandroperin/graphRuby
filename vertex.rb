class Vertex
	def init(_name)
		@name = _name
		@added = false
	end
	
	def get_name
		return @name
	end
	
	def get_added
		return @added
	end
	
	def set_added(_added)
		@added = _added
	end
end

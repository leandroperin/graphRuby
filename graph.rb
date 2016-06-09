require_relative "vertex"

class Graph
	Edge = Struct.new(:vertex1, :vertex2, :value) do
		def get_vertex1
			return vertex1
		end
		
		def get_vertex2
			return vertex2
		end
		
		def get_value
			return #{value}
		end		
	end

	def init(_vertex)
		@vertex_list = Array.new
		@vertex_list << _vertex
		_vertex.set_added true
		
		@edge_list = Array.new
	end
	
	def push_vertex(_vertex)
		@vertex_list << _vertex
		_vertex.set_added true
	end
	
	def pop_vertex(_vertex)
		if @vertex_list.count == 1
			puts "ERROR: It is not possible to remove the vertex because it is the only one remaining in the graph!"
		else
			remove_connections _vertex
			@vertex_list.delete(_vertex)
			_vertex.set_added false
		end
	end
	
	def connect(_vertex1, _vertex2, _value)
		if _vertex1.get_added and _vertex2.get_added
			disconnect _vertex1, _vertex2
			
			edge = Edge.new(_vertex1, _vertex2, _value)
			@edge_list << edge
		else
			puts "ERROR: It is not possible to connect because a vertex does not belong to the graph!"
		end
	end
	
	def disconnect(_vertex1, _vertex2)
		@edge_list.each do |i|
			if i.get_vertex1 == _vertex1 and i.get_vertex2 == _vertex2
				@edge_list.delete(i)
				break
			elsif i.get_vertex1 == _vertex2 and i.get_vertex2 == _vertex1
				@edge_list.delete(i)
				break
			end
		end
	end
	
	def remove_connections(_vertex)
		toDelete = Array.new
	
		@edge_list.each do |i|
			if i.get_vertex1 == _vertex or i.get_vertex2 == _vertex
				toDelete << i
			end
		end
		
		toDelete.each do |i|
			@edge_list.delete(i)
		end
	end
	
	def get_order
		return @vertex_list.count
	end
	
	def get_vertex_list
		return @vertex_list
	end
	
	def get_random_vertex
		position = rand(@vertex_list.count)
		return @vertex_list[position]
	end
	
	def get_adjacent_list(_vertex)
		adj_list = Array.new
		
		@edge_list.each do |i|
			if i.get_vertex1 == _vertex
				adj_list << i.get_vertex2
			elsif i.get_vertex2 == _vertex
				adj_list << i.get_vertex1
			end
		end

		return adj_list
	end
	
	def get_degree(_vertex)
		return get_adjacent_list(_vertex).count
	end
end

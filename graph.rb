require_relative "vertex"
require 'ostruct'

class Graph
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
			remove_all_connections
			@vertex_list.delete(_vertex)
			_vertex.set_added false
		end
	end
	
	def connect(_vertex1, _vertex2, _value)
		if _vertex1.get_added and _vertex2.get_added
			remove_connections _vertex1, _vertex2
			
			edge = OpenStruct.new
			edge.vertex1 = _vertex1
			edge.vertex2 = _vertex2
			edge.value = _value
			
			@edge_list << edge
		else
			puts "ERROR: It is not possible to connect because a vertex does not belong to the graph!"
		end
	end
	
	def disconnect(_vertex1, _vertex2)
		@edge_list.each do |i|
			if i.vertex1 == _vertex1 and i.vertex2 == _vertex2
				@edge_list.delete(i)
				break
			elsif i.vertex1 == _vertex2 and i.vertex2 == _vertex1
				@edge_list.delete(i)
				break
			end
		end
	end
	
	def remove_connections(_vertex1, _vertex2)
	
	end
	
	def remove_all_connections
		
	end
	
	def order
		return @vertex_list.count
	end
	
	def get_vertex_list
		return @vertex_list
	end
	
	def random_vertex
		position = rand(@vertex_list.count)
		return @vertex_list[position]
	end
	
	def adjacent_vertex_list(_vertex)
		adj_list = Array.new
		
		@edge_list.each do |i|
			if i.vertex1 == _vertex
				adj_list << i._vertex2
			elsif i.vertex2 == _vertex
				adj_list << i._vertex1
			end
		end
		
		return adj_list
	end
	
	def degree(_vertex)
		return adjacent_vertex_list(_vertex).count
	end
end

v1 = Vertex.new
v1.init "1"

v2 = Vertex.new
v2.init "2"

v3 = Vertex.new
v3.init "3"

g = Graph.new
g.init v1

g.push_vertex v2
g.push_vertex v3
g.connect(v1,v2,3)
g.connect(v1,v3,4)
puts g.degree(v1)
g.disconnect(v3,v1)
puts g.degree(v1)

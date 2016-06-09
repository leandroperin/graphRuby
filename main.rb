require_relative "graph"

def init
	sp = Vertex.new
	rj = Vertex.new
	es = Vertex.new
	mg = Vertex.new
	pr = Vertex.new
	sc = Vertex.new
	rs = Vertex.new
	sp.init "São Paulo"
	rj.init "Rio de Janeiro"
	es.init "Espírito Santo"
	mg.init "Minas Gerais"
	pr.init "Paraná"
	sc.init "Santa Catarina"
	rs.init "Rio Grande do Sul"
	
	@graph = Graph.new
	@graph.init sp
	
	@graph.push_vertex rj
	@graph.push_vertex es
	@graph.push_vertex mg
	@graph.push_vertex pr
	@graph.push_vertex sc
	@graph.push_vertex rs
	
	@graph.connect mg,es,1
	@graph.connect mg,rj,1
	@graph.connect mg,sp,1
	@graph.connect es,rj,1
	@graph.connect rj,sp,1
	@graph.connect sp,pr,1
	@graph.connect pr,sc,1
	@graph.connect sc,rs,1
end

def connected(_vertex1, _vertex2)
	return @graph.get_adjacent_list(_vertex1).include?(_vertex2)
end

system "clear"

init
vertex_list = @graph.get_vertex_list

puts "-------------------------------------------------------"
puts "     INE5413 - Implementação de Estrutura de Grafos    "
puts "-------------------------------------------------------";
puts " Quantidade de estados: " + @graph.get_order.to_s

begin
	puts "\n Estados: 1:SP - 2:RJ - 3:ES - 4:MG - 5:PR - 6:SC - 7:RS"
	puts " Escolha dois para descobrir se fazem fronteira:        "
	
	v1 = gets
	v2 = gets
	
	vertex1 = vertex_list[v1.to_i - 1]
	vertex2 = vertex_list[v2.to_i - 1]
	
	if connected(vertex1, vertex2)
		puts "\n Fazem fronteira!"
	else
		puts "\n Não fazem fronteira!"
	end
	
	puts "\nDeseja fazer outra consulta? (y/n)"
	option = gets.chomp
end while option == "y"
	puts "\n-------------------------------------------------------";
	puts "                   Powered by RUBY"	
	puts "-------------------------------------------------------";

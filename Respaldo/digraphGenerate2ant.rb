# define class DigraphGenerate 
class DigraphGenerate
	
	def initialize()
		@pila = Array.new 
		@idG=0
		@nodeId=0
		@edgeId=0
		@snodes=0
		@graph=0
		@pilacolor=Array.new
		@estado=4
	
		File.open('grafGenerate.graphml', 'w') do |f1|  # '\n' es el retorno de carro
	 		
			f1.puts "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
			f1.puts "<graphml>"
			f1.puts "<key attr.name=\"label\" attr.type=\"string\" for=\"node\" id=\"label\"/>"
			f1.puts "<key attr.name=\"Edge Label\" attr.type=\"string\" for=\"edge\" id=\"edgelabel\"/>"
			f1.puts "<key attr.name=\"weight\" attr.type=\"double\" for=\"edge\" id=\"weight\"/>"
			f1.puts "<key attr.name=\"r\" attr.type=\"int\" for=\"node\" id=\"r\"/>"
			f1.puts "<key attr.name=\"g\" attr.type=\"int\" for=\"node\" id=\"g\"/>"
			f1.puts "<key attr.name=\"b\" attr.type=\"int\" for=\"node\" id=\"b\"/>"
			f1.puts "<key attr.name=\"x\" attr.type=\"float\" for=\"node\" id=\"x\"/>"
	  		f1.puts "<key attr.name=\"y\" attr.type=\"float\" for=\"node\" id=\"y\"/>"
			f1.puts "<key attr.name=\"size\" attr.type=\"float\" for=\"node\" id=\"size\"/>"
			f1.puts "<key attr.name=\"Tipo\" attr.type=\"string\" for=\"node\" id=\"tipo\"/>"
		end
			
		getRandom()
		
		
			
		
	
	end
	
	def addNodeId()
		@nodeId+=1
		return @nodeId
	end
	
	def addEdgeId()
		@edgeId+=1
		return @edgeId		
	end
	
	def getRandom()
		while true
			r=rand(1..11)
			case @estado
			when 7, 3
				case r
				when 1, 2   #orig 1
					createSNode()
					
				when 3, 4, 5, 6, 7, 8, 9 #orig 2, 3, 4, 5
					createNode()
				else
					createEdge()
	#				if @pila.size==1
	#					createEdge()		
	#				else
	#					getRandom(,3)
	#				end
				end
			when 2
				case r
				when 1
					createSNode()
				else
					createNode
				end
			when 4
				initGraph()

			when 5
				finalizeGraph()
		
			when 6
				if @pila.size>1
					puts "pop"
					@pila.pop
					@pilacolor.pop
					finalizeSNode()
	
				
				else
					File.open('grafGenerate.graphml', 'a+') do |f1|
						f1.puts "</graphml>"
					end
					print "Cantidad de Nodos Creados: " + @nodeId.to_s + "\n"
					print "Cantidad de Aristas creadas: "  + @edgeId.to_s + "\n"
					print "Cantidad de Snodes creados: "  + @snodes.to_s + "\n"
					File.open('DiGraphGenerate.log', 'w') do |f2|  # '\n' es el retorno de carro
						f2.puts "Cantidad de Nodos Creados: " + @nodeId.to_s + "\n"
						f2.puts "Cantidad de Aristas creadas: "  + @edgeId.to_s + "\n"
						f2.puts "Cantidad de SuperNodos creados: "  + @snodes.to_s + "\n"

					end
					break;
				
	#				case r
	#				when 1
	#					createSNode(f1)
	#				when 2, 3, 4
	#					createNode(f1)
	#				else
	#					f1.puts "</graphml>"
	#				end
				end

			
			end
		
			#rand(1..n+10)
		
		
		end		
	end
	
	def initGraph()
		@pila << [@idG]
		@pilacolor << color
		@graph+=1
		File.open('grafGenerate.graphml', 'a+') do |f1|
			f1.puts "<graph id=\"" + @idG.to_s + "\" edgedefault=\"directed\">"
		end	
		#puts "Grafo id:"
		#puts @pila.last.last
		@estado= 2
		
	end
	
	def createNode()
		puts @nodeId
		@pila.last << addNodeId()
		#puts "node:"	
		#puts @pila.last.last
		
		File.open('grafGenerate.graphml', 'a+') do |f1|
			f1.puts "<node id=" +"\"" + @nodeId.to_s + "\"" + " idG=" +"\"" + @pila.last[0].to_s + "\" >"
			f1.puts "<data key=\"label\">" + @nodeId.to_s + "</data>"

			f1.puts	"<data key=\"texfile\">" 
			1.upto(1000){|i| f1.puts " Lorem Ipsum " + @nodeId.to_s + "Linea numero #{ i } \\\\" } 
			f1.puts "</data>"

			f1.puts "<data key=\"tipo\">1</data>"
			f1.puts "<data key=\"size\">100.0</data>"
			f1.puts	"<data key=\"r\">" +  @pilacolor.last["r"] + "</data>"
			f1.puts "<data key=\"g\">" +  @pilacolor.last["g"] + "</data>"
			f1.puts "<data key=\"b\">" +  @pilacolor.last["b"] + "</data>"
			f1.puts	"<data key=\"x\">226.64539</data>"
			f1.puts	"<data key=\"y\">-71.190186</data>"
			f1.puts "</node>\n"
		end
		
		@estado=3

	end
	
	def createSNode()
		puts @nodeId
		@pila.last << addNodeId
		puts "Snode:"
		puts @pila.last.last
		@snodes+=1
		
		File.open('grafGenerate.graphml', 'a+') do |f1|
			f1.puts "<node id=" +"\"" + @nodeId.to_s + "\"" + " idG=" +"\"" + @pila.last[0].to_s + "\" >"
			f1.puts "<data key=\"label\">" + @nodeId.to_s + "</data>"

			f1.puts	"<data key=\"texfile\">" 
			1.upto(10000){|i| f1.puts " Lorem Ipsum " + @nodeId.to_s + "Linea numero #{ i } \\newline" } 
			f1.puts "</data>" 

			f1.puts "<data key=\"tipo\">3</data>"
			f1.puts "<data key=\"size\">100.0</data>"
			f1.puts	"<data key=\"r\">" + @pilacolor.last["r"] + "</data>"
			f1.puts "<data key=\"g\">" + @pilacolor.last["g"] + "</data>"
			f1.puts "<data key=\"b\">" + @pilacolor.last["b"] + "</data>"
			f1.puts	"<data key=\"x\">226.64539</data>"
			f1.puts	"<data key=\"y\">-71.190186</data>"
		end		
		@idG=@pila.last.last	
		@estado=4	
		#initGraph()

	end
	
	def createEdge() #primer elementos de la lista dice a que Grafo Id pertenece
		iteration=0
		@estado=5
		@pila.last.each do |e|
			if iteration>0
				if e != @pila.last.last
					puts "Edge:"
					puts e
					
					File.open('grafGenerate.graphml', 'a+') do |f1|
						f1.puts "<edge id=" +"\"" + addEdgeId.to_s + "\"" + " source=\""+ e.to_s + "\" target=\"" + randomEdge(iteration, @pila.last) + "\" idG=\"" + @pila.last[0].to_s + "\" >"
						f1.puts "<data key=\"weight\">1.0</data>"
						f1.puts "</edge>"
					end
				end
			end	
			iteration+=1		
		end
		
		#finalizeGraph()

	end
	
	def finalizeGraph()
		File.open('grafGenerate.graphml', 'a+') do |f1|
			f1.puts "</graph>"
		end
		@estado=6
	end
	
	def finalizeSNode()
		puts "Finalize snode"
		File.open('grafGenerate.graphml', 'a+') do |f1|
			f1.puts "</node>\n"
		end
		@estado=7
		
	end
	
	def randomEdge(iteration ,pila)
		if iteration==(pila.size-2)
			return pila[pila.size-1].to_s
		else
			a=iteration+1
			b=pila.size-1
#			puts "pila:"
#			puts pila
#			puts "pila size"
#			puts pila.size

#			puts "a:"
#			puts a

#			puts "b:"
#			puts b
			
			r=rand(a..b)
			return pila[r].to_s
		end
		
		
	end
	
	def color()
		rgb = [{'r' => '77','g' => '195','b' => '195'}, {'r' => '255','g' => '229','b' => '0'}, {'r' => '255','g' => '148','b' => '0'}, {'r' => '255','g' => '0','b' => '0'},{'r' => '123','g' => '104','b' => '238'},{'r' => '0','g' => '0','b' => '255'},{'r' => '255','g' => '0','b' => '0'},{'r' => '0','g' => '255','b' => '0'},{'r' => '0','g' => '191','b' => '255'},{'r' => '0','g' => '250','b' => '154'},{'r' => '173','g' => '22','b' => '170'}]
		if @graph>10
			puts rgb[10]
			return rgb[10]
		else
			puts rgb[@graph]
			return rgb[@graph]
		end
	end
	
end

digrafo = DigraphGenerate.new()  

  

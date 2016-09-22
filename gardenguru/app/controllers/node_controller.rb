class NodeController < ApplicationController
include Neo4j::ActiveNode
require 'neo4j-core'
	def index
		#ret = Plant.query_as(:n).match("(n:Vegetable) RETURN n.name UNION MATCH (n:Fruit) RETURN n.name UNION MATCH (n:Herb) RETURN n.name UNION MATCH (n:Flower) RETURN n.name")
		ret = Plant.query_as(:n).match("(n:Vegetable) RETURN n UNION MATCH (n:Vegetable) RETURN n UNION MATCH (n:Fruit) RETURN n UNION MATCH (n:Herb) RETURN n UNION MATCH (n:Flower)").pluck(:n)

		@plants = []
		i = 0
		ret.each { |p|
			puts "Node properties: "
			puts p.props

			#p.props.each { |key,prop|
			#	puts key
			#	puts prop
			#}

			puts "Name: " + p.props[:name] 
			puts "Description: " + (p.props[:description].to_s == '' ? "No description" : p.props[:description])
			@plants.push(p)
			i = i + 1
		}
		puts i.to_s + " nodes"
		@plants.sort_by! { |plant| plant.props[:name].to_s }
		# @vegetable = Vegetable.find_by(name: 'Asparagus')
	end

	def show
		@name = params[:name].capitalize
		puts "show action. name = " + @name

		session = Neo4j::Session.open(:server_db, "http://neo4j:sauerkraut@localhost:7474")
		query = "MATCH (n) WHERE (n.name = \"" + @name + "\") RETURN n limit 1"

		@node = Neo4j::Session.query(query).first[:n]

		#node_enumerator = session.query(query)
		#@node = Plant.query_as(:n).match("(n:Vegetable) RETURN n UNION MATCH (n: Fruit) RETURN n UNION MATCH (n: Herb) RETURN n UNION MATCH (n: Flower) where n.name = \"" + @name + "\" LIMIT 1")
		
		#node = node_enumerator.next
		puts "Found a node!" 
		puts @node.props

	end

	def computePermutations

		@plants = JSON.parse params[:plants]
		numPlants = @plants.length 

		# TODO: special case when there is only one plant

		# TODO: there has to be an easier way to build a query
		query = "MATCH p="
		puts "there are " + numPlants.to_s + " plants"
		i = 1
		@plants.each { |p|
			puts p
			query << "(_" + i.to_s + ")-[:HELPS]-"
			i = i + 1
		}

		query = query[0,query.length-10] + " WHERE ALL (n in nodes(p) WHERE n.name IN "

		query << @plants.to_s << " AND 1 = size(filter(m in nodes(p) where m = n))) RETURN DISTINCT nodes(p);"

		puts "query = " + query 

		results = Neo4j::Session.query(query)
		permutations = Array.new
		i = 1

		results.each { |r| 
			puts "Found a planting order!"
			permutation = Array.new
			r.first.each { |plant| 
				puts plant.name
				permutation << plant.name
			}
			permutations << permutation
			i = i + 1
		}

		puts "permutations" + permutations.to_s
		# If result is empty or score is 0 tell the user none of these plants have a compatibility
		render json: permutations.to_json, status: :ok
	end

end

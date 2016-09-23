Latest db dump: src/main/resources/garden_graph_dump.cypher

    bin/neo4j-sh -c dump > ~/gardenguru/src/main/resources/db_dump_$(date +"%y%m%d_%H%M%S").cypher

To import the data:

    bin/neo4j-sh -c -file ~/gardenguru/src/main/resources/db_dump.cypher

To run: 
    rails server

http://localhost:3000/index
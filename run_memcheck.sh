#!/bin/bash
# # fuseki
# echo "$(date): Starting Fuseki (T), T-Workers: 16"
# ./iguana_suites/sparql/Fuseki/watdiv10000/16-start.sh &> /dev/null
# pid=$(cat fuseki.pid)
# filename="fuseki_memres.txt"
# mem_cmd="pmap -x $pid > $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename"
# eval "${mem_cmd}" & disown
# echo "$(date): Running IGUANA (T Limit) for Fuseki (all) , T-Workers: 16"
# ./iguana-run.sh ./iguana_suites/sparql/Fuseki/watdiv10000/16-T.yml &> /dev/null
# echo "$(date): Stopping Fuseki (T), T-Workers: 16"
# ./iguana_suites/sparql/Fuseki/stop.sh &> /dev/null
# sleep 10s
# blazegraph
# echo "$(date): Starting Blazegraph (T), T-Workers: 16"
# ./iguana_suites/sparql/Blazegraph/watdiv10000/16-start.sh &> /dev/null
# pid=$(cat blazegraph.pid)
# filename="blazegraph_memres.txt"
# mem_cmd="pmap -x $pid > $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename"
# eval "${mem_cmd}" & disown
# echo "$(date): Running IGUANA (T Limit) for Blazegraph (all) , T-Workers: 16"
# ./iguana-run.sh ./iguana_suites/sparql/Blazegraph/watdiv10000/16-T.yml &> /dev/null
# echo "$(date): Stopping Blazegraph (T), T-Workers: 16"
# ./iguana_suites/sparql/Blazegraph/stop.sh &> /dev/null
# sleep 10s
# # virtuoso
# echo "$(date): Starting Virtuoso (T), T-Workers: 16"
# ./iguana_suites/sparql/Virtuoso/watdiv10000/16-start.sh &> /dev/null
# pid=$(cat virtuoso.pid)
# filename="virtuoso_memres.txt"
# mem_cmd="pmap -x $pid > $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename"
# eval "${mem_cmd}" & disown
# echo "$(date): Running IGUANA (T Limit) for Virtuoso (all) , T-Workers: 16"
# ./iguana-run.sh ./iguana_suites/sparql/Virtuoso/watdiv10000/16-T.yml &> /dev/null
# echo "$(date): Stopping Virtuoso (T), T-Workers: 16"
# ./iguana_suites/sparql/Virtuoso/stop.sh &> /dev/null
# sleep 10s
# graphdb
# echo "$(date): Starting GraphDB (T), T-Workers: 1"
# ./iguana_suites/sparql/GraphDB/watdiv10000/1-start.sh &> /dev/null
# pid=$(cat graphdb.pid)
# filename="graphdb_memres.txt"
# mem_cmd="pmap -x $pid > $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename"
# eval "${mem_cmd}" & disown
# echo "$(date): Running IGUANA (T Limit) for GraphDB (all) , T-Workers: 1"
# ./iguana-run.sh ./iguana_suites/sparql/GraphDB/watdiv10000/1-T.yml &> /dev/null
# echo "$(date): Stopping GraphDB (T), T-Workers: 1"
# ./iguana_suites/sparql/GraphDB/stop.sh &> /dev/null
# sleep 10s
# # tentris
# echo "$(date): Starting TentrisLJ (T), T-Workers: 16"
# ./iguana_suites/sparql/TentrisLJ/watdiv10000/16-start.sh &> /dev/null
# pid=$(cat tentris.pid)
# filename="tentris_memres.txt"
# mem_cmd="pmap -x $pid > $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename"
# eval "${mem_cmd}" & disown
# echo "$(date): Running IGUANA (T Limit) for TentrisLJ (all) , T-Workers: 1"
# ./iguana-run.sh ./iguana_suites/sparql/TentrisLJ/watdiv10000/16-T.yml &> /dev/null
# echo "$(date): Stopping TentrisLJ (T), T-Workers: 16"
# ./iguana_suites/sparql/TentrisLJ/stop.sh &> /dev/null
# sleep 10s
###### GraphQL #####
# neo4j
# echo "$(date): Starting Neo4J (all), T-Workers: 16"
# ./iguana_suites/graphql/neo4j/lingbm1000/16-start.sh &> /dev/null
# pid=$(cat neo4j.pid)
# filename="neo4j_memres.txt"
# mem_cmd="pmap -x $pid > $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename"
# eval "${mem_cmd}" & disown
# echo "$(date): Running IGUANA (T Limit) for Neo4J (all) , T-Workers: 16"
# ./iguana-run.sh ./iguana_suites/graphql/neo4j/lingbm1000/16-all-T.yml &> /dev/null
# echo "$(date): Stopping Neo4J (all), T-Workers: 16"
# ./iguana_suites/graphql/neo4j/lingbm1000/stop.sh &> /dev/null
# sleep 10s
# tentris
echo "$(date): Starting TentrisLJ (all), T-Workers: 16"
./iguana_suites/graphql/TentrisLJ/lingbm1000/16-start.sh &> /dev/null
pid=$(cat tentris.pid)
filename="tentris_graphql_memres.txt"
mem_cmd="pmap -x $pid > $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename; sleep 9m ; pmap -x $pid >> $filename"
eval "${mem_cmd}" & disown
echo "$(date): Running IGUANA (T Limit) for TentrisLJ (all) , T-Workers: 16"
./iguana-run.sh ./iguana_suites/graphql/TentrisLJ/lingbm1000/16-all-T.yml &> /dev/null
echo "$(date): Stopping TentrisLJ (all), T-Workers: 16"
./iguana_suites/graphql/TentrisLJ/stop.sh &> /dev/null
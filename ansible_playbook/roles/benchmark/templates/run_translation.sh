#!/bin/bash
echo "$(date): GraphQL benchmarks - Neo4j & Apollo server"
echo "$(date): Running Time Limit suites - 1 worker only"
# run neo4j
echo 3 >/proc/sys/vm/drop_caches
echo "$(date): Starting Neo4J for LinGBM1000"
./iguana_suites/graphql/neo4j/lingbm1000/1-start.sh &> /dev/null
echo "$(date): Starting Apollo Server"
node ./systems/neo4j/translation.js &
a_id="$!"
sleep 1m
echo "$(date): Running IGUANA (Time Limit) for Neo4J&Apollo and LinGBM1000"
./iguana-run.sh ./iguana_suites/graphql/neo4j/lingbm1000/1-translation-all-T.yml &> /dev/null
echo "$(date): Stopping Neo4J for LinGBM1000"
./iguana_suites/graphql/neo4j/lingbm1000/stop.sh &> /dev/null
echo "$(date): Stopping Apollo Server"
kill -9 "$a_id"
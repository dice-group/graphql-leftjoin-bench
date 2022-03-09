#!/bin/bash
workers=( 1 4 8 16 )
echo "$(date): GraphQL benchmarks"
# run Query Mixes suites -- only for 1 worker
echo "$(date): Running Query Mixes suites (one worker only)"
# run neo4j
echo 3 >/proc/sys/vm/drop_caches
echo "$(date): Starting Neo4J for LinGBM1000 (qts), QM-Workers: 1"
./iguana_suites/graphql/neo4j/lingbm1000/1-start.sh &> /dev/null
echo "$(date): Running IGUANA (QM Limit) for Neo4J and LinGBM1000 (qts) , QM-Workers: 1"
./iguana-run.sh ./iguana_suites/graphql/neo4j/lingbm1000/1-qts-QM.yml &> /dev/null
echo "$(date): Stopping Neo4J for LinGBM1000 (qts), QM-Workers: 1"
./iguana_suites/graphql/neo4j/lingbm1000/stop.sh &> /dev/null
# run tentrislj
echo 3 >/proc/sys/vm/drop_caches
echo "$(date): Starting Tentris for LinGBM1000 (qts), QM-Workers: 1"
./iguana_suites/graphql/TentrisLJ/lingbm1000/1-start.sh &> /dev/null
echo "$(date): Running IGUANA (QM Limit) for Tentris and LinGBM1000 (qts), QM-Workers: 1"
./iguana-run.sh ./iguana_suites/graphql/TentrisLJ/lingbm1000/1-qts-QM.yml &> /dev/null
echo "$(date): Stopping Tentris for LinGBM1000 (qts), QM-Workers: 1"
./iguana_suites/graphql/TentrisLJ/stop.sh &> /dev/null
# run tentrisljbase
echo 3 >/proc/sys/vm/drop_caches
echo "$(date): Starting Tentris for LinGBM1000 (qts), QM-Workers: 1"
./iguana_suites/graphql/TentrisLJBase/lingbm1000/1-start.sh &> /dev/null
echo "$(date): Running IGUANA (QM Limit) for Tentris and LinGBM1000 (qts), QM-Workers: 1"
./iguana-run.sh ./iguana_suites/graphql/TentrisLJBase/lingbm1000/1-qts-QM.yml &> /dev/null
echo "$(date): Stopping Tentris for LinGBM1000 (qts), QM-Workers: 1"
./iguana_suites/graphql/TentrisLJBase/stop.sh &> /dev/null
# run time limit queries -- multiple workers
echo "$(date): Running Time Limit suites (multiple workers)"
for i in "${workers[@]}"
do
	# run neo4j
	echo 3 >/proc/sys/vm/drop_caches
	echo "$(date): Starting Neo4J (all), T-Workers: $i"
	./iguana_suites/graphql/neo4j/lingbm1000/"$i"-start.sh &> /dev/null
	echo "$(date): Running IGUANA (T Limit) for Neo4J (all) , T-Workers: $i"
	./iguana-run.sh ./iguana_suites/graphql/neo4j/lingbm1000/"$i"-all-T.yml &> /dev/null
	echo "$(date): Stopping Neo4J (all), QM-Workers: $i"
	./iguana_suites/graphql/neo4j/lingbm1000/stop.sh &> /dev/null
	# run tentrislj
	echo 3 >/proc/sys/vm/drop_caches
	echo "$(date): Starting TentrisLJ (all), T-Workers: $i"
	./iguana_suites/graphql/TentrisLJ/lingbm1000/"$i"-start.sh &> /dev/null
	echo "$(date): Running IGUANA (T Limit) for TentrisLJ (all), T-Workers: $i"
	./iguana-run.sh ./iguana_suites/graphql/TentrisLJ/lingbm1000/"$i"-all-T.yml &> /dev/null
	echo "$(date): Stopping Tentris (all), T-Workers: $i"
	./iguana_suites/graphql/TentrisLJ/stop.sh &> /dev/null
	# run tentrisljbase
	echo 3 >/proc/sys/vm/drop_caches
	echo "$(date): Starting TentrisLJ (all), T-Workers: $i"
	./iguana_suites/graphql/TentrisLJBase/lingbm1000/"$i"-start.sh &> /dev/null
	echo "$(date): Running IGUANA (T Limit) for TentrisLJ (all), T-Workers: $i"
	./iguana-run.sh ./iguana_suites/graphql/TentrisLJBase/lingbm1000/"$i"-all-T.yml &> /dev/null
	echo "$(date): Stopping Tentris (all), T-Workers: $i"
	./iguana_suites/graphql/TentrisLJBase/stop.sh &> /dev/null
done
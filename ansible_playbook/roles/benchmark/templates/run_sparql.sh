#!/bin/bash
triplestores=( "Fuseki" "Blazegraph" "GraphDB" "Virtuoso" "TentrisLJ" )
workers=( 1 4 8 16 )
echo "SPARQL benchmark"
echo "Running Query Mixes suites (one worker)"
for ts in "${triplestores[@]}"
do
	echo 3 >/proc/sys/vm/drop_caches
	echo "$(date): Starting $ts"
	./iguana_suites/sparql/"$ts"/watdiv10000/1-start.sh &> /dev/null
	echo "$(date): Running IGUANA (Query Mixes) for $ts"
	./iguana-run.sh ./iguana_suites/sparql/"$ts"/watdiv10000/1-QM.yml &> /dev/null
	echo "$(date): Stopping $ts"
	./iguana_suites/sparql/"$ts"/stop.sh &> /dev/null
done 
echo "Running Time Limit suites (multiple workers)"
for ts in "${triplestores[@]}"
do
	for i in "${workers[@]}"
	do
		if [ "$ts" == "GraphDB" ] && [ "$i" -gt "1" ] ; then # graphdb-free does not support concurrent clients
    	continue
  	fi
		echo 3 >/proc/sys/vm/drop_caches
		echo "$(date): Starting $ts, Workers: $i"
		./iguana_suites/sparql/"$ts"/watdiv10000/"$i"-start.sh &> /dev/null
		echo "$(date): Running IGUANA (Time Limit) for $ts, Workers: $i"
		./iguana-run.sh ./iguana_suites/sparql/"$ts"/watdiv10000/"$i"-T.yml &> /dev/null
		echo "$(date): Stopping $ts, Workers: $i"
		./iguana_suites/sparql/"$ts"/stop.sh &> /dev/null
	done
done
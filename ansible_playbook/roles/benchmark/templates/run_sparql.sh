#!/bin/bash
triplestores=( "Fuseki" "Blazegraph" "GraphDB" "Virtuoso" "TentrisLJ" )
workers=( 1 4 8 16 )
echo "SPARQL benchmark"
echo "Running Time Limit suites (multiple workers)"
for ts in "${triplestores[@]}"
do
	if [[ "$ts" == "GraphDB" ]]; then
    continue
  fi
	for i in "${workers[@]}"
	do
		echo "$(date): Starting $ts, Workers: $i"
		./iguana_suites/sparql/"$ts"/watdiv10000/"$i"-start.sh &> /dev/null
		echo "$(date): Running IGUANA (QM Limit) for $ts, Workers: $i"
		./iguana-run.sh ./iguana_suites/sparql/"$ts"/watdiv10000/"$i"-T.yml &> /dev/null
		echo "$(date): Stopping $ts, Workers: $i"
		./iguana_suites/sparql/"$ts"/stop.sh &> /dev/null
	done
done
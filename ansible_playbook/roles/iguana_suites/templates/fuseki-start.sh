#! /bin/bash

if [[ -f {{ target_dir }}/fuseki.pid ]]
then
    echo $(date --iso-8601) - Fuseki seems to be already running
    echo If it is not running remove fuseki.pid
    exit 1
fi

echo $(date --iso-8601) - Starting Fuseki

dir=$(pwd)

export FUSEKI_BASE={{ target_dir }}/systems/fuseki/apache-jena-fuseki-{{ fuseki_version }}
cd {{ target_dir }}/systems/fuseki/apache-jena-fuseki-{{ fuseki_version }}

java -Xmx{{ (system_memory * 0.5) | int }}K -jar {{ target_dir }}/systems/fuseki/apache-jena-fuseki-{{ fuseki_version }}/fuseki-server.jar --tdb2 --loc={{ target_dir }}/databases/fuseki/{{ item[1].name }} /{{ item[1].name }} </dev/null 2>&1 >{{ target_dir }}/logs/run/fuseki-{{ item[1].name }}-{{ item[2].number }}.log & disown
pid=$!

echo $pid > {{ target_dir }}/fuseki.pid

echo $(date --iso-8601) - Waiting for Fuseki to become available

while :
do
    curl -s 127.0.0.1:3030
    if [ $? -eq 0 ]
    then
        break
    fi
    sleep 2
done

echo $(date --iso-8601) - Fuseki started and accepting connections

cd $dir
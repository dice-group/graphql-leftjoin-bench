#! /bin/bash

mkdir -p {{ target_dir }}/databases/graphdb/{{ item[1].name }}/data/

java -Xmx{{ load_max_ram }}K -cp "{{ target_dir }}/systems/graphdb/graphdb-free-{{ graphdb_version }}/lib/*" -Dgraphdb.dist={{ target_dir }}/systems/graphdb/graphdb-free-{{ graphdb_version }} -Dgraphdb.home.data={{ target_dir }}/databases/graphdb/{{ item[1].name }}/data/ -Djdk.xml.entityExpansionLimit=0 com.ontotext.graphdb.loadrdf.PreloadData -f -p -c {{ target_dir }}/systems/graphdb/graphdb-{{ item[1].name }}.ttl {{ item[1].path }} 2>&1 | tee {{ target_dir }}/logs/load/graphdb-{{ item[1].name }}.log
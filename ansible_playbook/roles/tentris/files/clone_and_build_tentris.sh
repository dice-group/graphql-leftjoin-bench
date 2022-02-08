#!/bin/bash

# clones and builds Tentris
function clone_and_build() {
  # args
  local version=$1

  local working_dir
  working_dir=$(pwd)

  tentris_code_dir="tentris_code_${version}_$(tr -dc a-z </dev/urandom | head -c 16)"
  git clone -b graphql-endpoint https://github.com/dice-group/tentris.git "${tentris_code_dir}" || exit
  
  cd "${tentris_code_dir}" || exit

  mkdir build && cd "$_" || exit

  echo "Building version of Tentris with the graphql-endpoint"

  build_with_docker "${version}"

  local tentris_deploy_dir
  tentris_deploy_dir="${working_dir}/${version}"

  mkdir $tentris_deploy_dir || exit

  cp ./* $tentris_deploy_dir
  cd "$working_dir" || exit

  rm -rf "${tentris_code_dir}"
}

# builds Tentris placed in the parent folder
function build_with_docker() {
  # args
  local version=$1

  local container_id
  local container_name
  container_name="${version}_$(tr -dc a-z </dev/urandom | head -c 16)"
  docker build --no-cache --build-arg TENTRIS_MARCH=native -t "${container_name}" ..
  container_id=$(docker create "${container_name}")
  docker cp "${container_id}":/tentris_server ./tentris_server
  docker cp "${container_id}":/tentris_terminal ./tentris_terminal
  docker cp "${container_id}":/rdf2ids ./rdf2ids
  docker cp "${container_id}":/ids2hypertrie ./ids2hypertrie
  docker container rm "${container_id}"
  docker image rm "${container_name}"
  echo "Binaries $(ls) were written to $(pwd)."
}

clone_and_build "$@"
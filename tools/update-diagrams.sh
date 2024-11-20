#!/bin/bash

set -e

SCRIPT=$(readlink -f $0)
BASEDIR=$(dirname $SCRIPT)/..

docker run \
	--user $UID:$GID \
	--rm \
	-v "${BASEDIR}:/usr/local/structurizr" \
	structurizr/cli export -f plantuml -o afbeeldingen -w workspace.dsl

docker run \
	--rm \
	--user $UID:$GID \
	-v $BASEDIR:/data/ \
	plantuml/plantuml -tsvg afbeeldingen

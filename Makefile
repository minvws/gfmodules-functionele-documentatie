SHELL := /bin/bash

BASEDIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
STRUCTURIZR_IMAGE := structurizr/cli
PLANTUML_IMAGE := plantuml/plantuml
MERMAID_FILE := node_modules/mermaid/dist/mermaid.min.js
D3_FILE := node_modules/d3/dist/d3.min.js
MERMAID_ELK_FILE := node_modules/@mermaid-js/layout-elk/dist/mermaid-layout-elk.esm.min.mjs

.PHONY: all clean puml

all: svg copy-mermaidjs html
dev: clean svg copy-mermaidjs livehtml

puml: workspace.dsl
	docker run --user $(shell id -u):$(shell id -g) --rm -v "$(BASEDIR)/workspace.dsl:/usr/local/structurizr/workspace.dsl" -v "$(BASEDIR)/docs/afbeeldingen:/usr/local/structurizr/docs/afbeeldingen" $(STRUCTURIZR_IMAGE) export -format plantuml -output docs/afbeeldingen -workspace workspace.dsl

svg: puml
	docker run --user $(shell id -u):$(shell id -g) --rm -v "$(BASEDIR)/docs/afbeeldingen:/source" $(PLANTUML_IMAGE) -tsvg "/source/*.puml"

clean:
	rm -f docs/afbeeldingen/*.puml docs/afbeeldingen/*.svg

livehtml:
	docker compose up

html:
	docker compose run --rm sphinx make html

# Copy mermaid, mermaid-layout-elk and d3 to docs/_static
copy-mermaidjs:
	[[ -d node_modules ]] || (echo "❌ 'node_modules' not found. Run 'npm install'." && exit 1)
	[[ -e $(MERMAID_FILE) ]] && cp $(MERMAID_FILE) docs/_static/js/mermaid.min.js
	[[ -e $(D3_FILE) ]] && cp $(D3_FILE) docs/_static/js/d3.min.js
	[[ -e $(MERMAID_ELK_FILE) ]] && cp $(MERMAID_ELK_FILE) docs/_static/js/mermaid-layout-elk.esm.min.mjs
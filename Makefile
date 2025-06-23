SHELL := /bin/bash

BASEDIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
STRUCTURIZR_IMAGE := structurizr/cli
PLANTUML_IMAGE := plantuml/plantuml

.PHONY: all clean puml

all: svg mermaid-svg html
dev: clean svg mermaid-svg livehtml

puml: workspace.dsl
	docker run --user $(shell id -u):$(shell id -g) --rm -v "$(BASEDIR)/workspace.dsl:/usr/local/structurizr/workspace.dsl" -v "$(BASEDIR)/docs/afbeeldingen:/usr/local/structurizr/docs/afbeeldingen" $(STRUCTURIZR_IMAGE) export -format plantuml -output docs/afbeeldingen -workspace workspace.dsl

svg: puml
	docker run --user $(shell id -u):$(shell id -g) --rm -v "$(BASEDIR)/docs/afbeeldingen:/source" $(PLANTUML_IMAGE) -tsvg -o "/source" "/source/*.puml"
	rm -f docs/afbeeldingen/*.puml

clean:
	rm -f docs/afbeeldingen/*.puml docs/afbeeldingen/*.svg

livehtml:
	docker compose up

html:
	docker compose run --rm sphinx make html

mermaid-svg:
	[[ -d node_modules ]] || (echo "❌ 'node_modules' not found. Run 'npm install'." && exit 1)
	@echo "Processing markdown files with Mermaid diagrams..."
	@find docs -type f -name "*.md" | while read -r file; do \
		echo "Processing $$file..."; \
		./node_modules/.bin/mmdc -i "$$file" -o "$${file%.md}.md" || echo "⚠️  Failed to process $$file"; \
	done

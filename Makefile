SHELL := /bin/bash

BASEDIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
STRUCTURIZR_IMAGE := structurizr/cli
PLANTUML_IMAGE := plantuml/plantuml

# Build directory for processed files
BUILD_DIR := build
DOCS_BUILD_DIR := $(BUILD_DIR)/docs

.PHONY: all clean puml clean-build

all: svg mermaid-svg html
dev: clean svg mermaid-svg html livehtml

puml: workspace.dsl
	docker run --user $(shell id -u):$(shell id -g) --rm -v "$(BASEDIR)/workspace.dsl:/usr/local/structurizr/workspace.dsl" -v "$(BASEDIR)/docs/afbeeldingen:/usr/local/structurizr/docs/afbeeldingen" $(STRUCTURIZR_IMAGE) export -format plantuml -output docs/afbeeldingen -workspace workspace.dsl

svg: puml
	docker run --user $(shell id -u):$(shell id -g) --rm -v "$(BASEDIR)/docs/afbeeldingen:/source" $(PLANTUML_IMAGE) -tsvg -o "/source" "/source/*.puml"
	rm -f docs/afbeeldingen/*.puml

clean: clean-build
	rm -f docs/afbeeldingen/*.puml docs/afbeeldingen/*.svg

clean-build:
	rm -rf $(DOCS_BUILD_DIR)

livehtml:
	docker compose up

html:
	docker compose run --rm sphinx make html

mermaid-svg: $(DOCS_BUILD_DIR)
	[[ -d node_modules ]] || (echo "❌ 'node_modules' not found. Run 'npm install'." && exit 1)
	@echo "Copying docs to build directory..."
	@cp -r docs/* $(DOCS_BUILD_DIR)/
	@echo "Processing markdown files with Mermaid diagrams..."
	@find $(DOCS_BUILD_DIR) -type f -name "*.md" | while read -r file; do \
		echo "Processing $$file..."; \
		npx mmdc -i "$$file" -o "$$file" || echo "⚠️  Failed to process $$file"; \
	done

$(DOCS_BUILD_DIR):
	@mkdir -p $(DOCS_BUILD_DIR)
SHELL := /bin/bash
.ONESHELL:

# Configuration
BASEDIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
BUILD_DIR := build
DOCS_DIR := docs
IMAGES_DIR := $(DOCS_DIR)/afbeeldingen
DOCS_BUILD_DIR := $(BUILD_DIR)/docs
WORKSPACE_FILE := workspace.dsl

# Docker images
STRUCTURIZR_IMAGE := structurizr/cli
PLANTUML_IMAGE := plantuml/plantuml
DOCKER_USER := $(shell id -u):$(shell id -g)

.PHONY: all clean puml svg clean-build dev livehtml html mermaid-svg help

help:
	@echo "Available targets:"
	@echo "  all        - Build everything (svg, mermaid-svg, html)"
	@echo "  dev        - Development build with live reload"
	@echo "  puml       - Generate PlantUML files from workspace.dsl"
	@echo "  svg        - Convert PlantUML to SVG"
	@echo "  mermaid-svg- Process Mermaid diagrams in markdown"
	@echo "  html       - Generate HTML documentation"
	@echo "  livehtml   - Start live reload server"
	@echo "  clean      - Clean generated files"
	@echo "  clean-build- Clean build directory"

all: svg html

dev: clean svg livehtml

check-workspace:
	@test -f $(WORKSPACE_FILE) || (echo "❌ $(WORKSPACE_FILE) not found" && exit 1)

check-node-modules:
	@test -d node_modules || (echo "❌ 'node_modules' not found. Run 'npm install'." && exit 1)

puml: check-workspace
	@echo "🔄 Generating PlantUML files..."
	@mkdir -p $(IMAGES_DIR)
	docker run --user $(DOCKER_USER) --rm \
		-v "$(BASEDIR)/$(WORKSPACE_FILE):/usr/local/structurizr/workspace.dsl" \
		-v "$(BASEDIR)/$(IMAGES_DIR):/usr/local/structurizr/docs/afbeeldingen" \
		$(STRUCTURIZR_IMAGE) export -format plantuml -output docs/afbeeldingen -workspace workspace.dsl || \
		(echo "❌ Failed to generate PlantUML files" && exit 1)
	@echo "✅ PlantUML files generated"

svg: puml
	@echo "🔄 Converting PlantUML to SVG..."
	docker run --user $(DOCKER_USER) --rm \
		-v "$(BASEDIR)/$(IMAGES_DIR):/source" \
		$(PLANTUML_IMAGE) -tsvg -o "/source" "/source/*.puml" || \
		(echo "❌ Failed to convert PlantUML to SVG" && exit 1)
	@echo "🧹 Cleaning up PlantUML files..."
	@rm -f $(IMAGES_DIR)/*.puml
	@echo "✅ SVG files generated"

clean: clean-build
	@echo "🧹 Cleaning generated files..."
	@rm -f $(IMAGES_DIR)/*.puml $(IMAGES_DIR)/*.svg
	@echo "✅ Cleaned"

clean-build:
	@echo "🧹 Cleaning build directory..."
	rm -rf $(DOCS_BUILD_DIR)
	@echo "✅ Build directory cleaned"

livehtml:
	docker compose --profile dev up

html: mermaid-svg
	@echo "🔄 Generating HTML documentation..."
	docker compose --profile ci run --rm sphinx-ci make html
	@echo "✅ HTML documentation generated"

mermaid-svg: check-node-modules $(DOCS_BUILD_DIR)
	@echo "🔄 Processing Mermaid diagrams..."
	@echo "📂 Copying docs to build directory..."
	@cp -r $(DOCS_DIR)/* $(DOCS_BUILD_DIR)/
	@echo "🔄 Processing markdown files with Mermaid diagrams..."
	@find $(DOCS_BUILD_DIR) -type f -name "*.md" | while read -r file; do \
		echo "Processing $$file..."; \
		./node_modules/.bin/mmdc -i "$$file" -o "$$file" || echo "⚠️  Failed to process $$file"; \
	done
	@echo "✅ Mermaid diagrams processed"

$(DOCS_BUILD_DIR):
	@mkdir -p $(DOCS_BUILD_DIR)

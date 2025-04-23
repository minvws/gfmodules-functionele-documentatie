BASEDIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
STRUCTURIZR_IMAGE := structurizr/cli
PLANTUML_IMAGE := plantuml/plantuml
SVG_FILES := docs/afbeeldingen/structurizr-generieke-functie-adressering.svg \
             docs/afbeeldingen/structurizr-generieke-functie-lokalisatie.svg

.PHONY: all clean puml

all: $(SVG_FILES) download html

# Make SVG generation dependent on puml target
$(SVG_FILES): puml

puml: workspace.dsl
	docker run --user $(shell id -u):$(shell id -g) --rm -v "$(BASEDIR):/usr/local/structurizr" $(STRUCTURIZR_IMAGE) export -f plantuml -o docs/afbeeldingen -w workspace.dsl

docs/afbeeldingen/%.svg: docs/afbeeldingen/%.puml workspace.dsl
	docker run --rm --user $(shell id -u):$(shell id -g) -v $(BASEDIR):/data/ $(PLANTUML_IMAGE) -tsvg $<

clean:
	rm -f docs/afbeeldingen/*.puml docs/afbeeldingen/*.svg

livehtml:
	docker compose up

html:
	docker compose run --rm sphinx make html

# Download d3 and mermaid
# https://registry.npmjs.org/mermaid/latest
# https://registry.npmjs.org/@mermaid-js/layout-elk/latest
# https://registry.npmjs.org/d3/latest
download:
	curl -sL -o - https://registry.npmjs.org/d3/-/d3-7.9.0.tgz | tar -Oxzf - package/dist/d3.min.js > docs/_static/js/d3.min.js
	curl -sL -o - https://registry.npmjs.org/mermaid/-/mermaid-11.6.0.tgz | tar -Oxzf - package/dist/mermaid.min.js > docs/_static/js/mermaid.min.js
	curl -sL -o - https://registry.npmjs.org/@mermaid-js/layout-elk/-/layout-elk-0.1.7.tgz | tar -Oxzf - package/dist/mermaid-layout-elk.esm.min.mjs > docs/_static/js/mermaid-layout-elk.esm.min.mjs
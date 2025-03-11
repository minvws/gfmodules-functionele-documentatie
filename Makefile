BASEDIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
STRUCTURIZR_IMAGE := structurizr/cli
PLANTUML_IMAGE := plantuml/plantuml
SVG_FILES := docs/afbeeldingen/structurizr-generieke-functie-adressering.svg \
             docs/afbeeldingen/structurizr-generieke-functie-lokalisatie.svg
MANON_SPHINX_THEME := https://github.com/minvws/icore-manon-sphinx-theme/actions/runs/13544738793/artifacts/2655913970

.PHONY: all clean puml

all: theme $(SVG_FILES) html

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

theme:
	curl --output docs/rijksoverheid_sphinx_theme.zip $(MANON_SPHINX_THEME)

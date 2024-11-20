BASEDIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
STRUCTURIZR_IMAGE := structurizr/cli
PLANTUML_IMAGE := plantuml/plantuml
SVG_FILES := afbeeldingen/structurizr-generieke-functie-adressering.svg \
             afbeeldingen/structurizr-generieke-functie-lokalisatie.svg

.PHONY: all clean puml

all: $(SVG_FILES)

# Make SVG generation dependent on puml target
$(SVG_FILES): puml

puml: workspace.dsl
	docker run --user $(shell id -u):$(shell id -g) --rm -v "$(BASEDIR):/usr/local/structurizr" $(STRUCTURIZR_IMAGE) export -f plantuml -o afbeeldingen -w workspace.dsl

afbeeldingen/%.svg: afbeeldingen/%.puml workspace.dsl
	docker run --rm --user $(shell id -u):$(shell id -g) -v $(BASEDIR):/data/ $(PLANTUML_IMAGE) -tsvg $<

clean:
	rm -f afbeeldingen/*.puml afbeeldingen/*.svg
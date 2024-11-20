livehtml:
	docker compose up

# Forwards all other make commands to the docker compose container
# 
%: Makefile
	docker compose run --rm sphinx make $@

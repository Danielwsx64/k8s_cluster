build_docker:
	./infra/build_image.sh

run_docker: 
	./infra/helpers/run_local_docker.sh

build_and_run_docker: build_docker run_docker

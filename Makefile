build_docker:
	@./infra/build_image.sh

run_docker: 
	@./infra/helpers/run_local_docker.sh

loadbalance:
	@cloud-provider-kind &>/dev/null &

stop_loadbalance:
	@pkill cloud-provider- 

k8s_boot: loadbalance
	@./infra/bootstrap_k8s.sh

bash:
	@./infra/helpers/k8s_remote.sh

remote:
	@./infra/helpers/k8s_remote.sh iex

open:
	@./infra/helpers/open_service.sh

logs:
	@./infra/helpers/k8s_pods_logs.sh

stop_logs:
	@./infra/helpers/k8s_pods_logs.sh stop

build_and_run_docker: build_docker run_docker

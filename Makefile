DOCKER_HUB:=docker.internal.asymmetric-effort.com
PKI_SERVER_DOCKER_IMAGE_NAME:=asymmetric-effort/pki-server:local
PKI_SERVER_DOCKER_CONTAINER_NAME:=pki-server
PKI_SERVER_IP_ADDRESS:=10.37.129.2
PKI_SERVER_PORT:=8080
PKI_SERVER_VOLUME:=$(HOME)/pki/data

pki_server/help:
	@echo '$@'
	@echo 'make pki_server/build     -> build the container locally'
	@echo 'make pki_server/upload    -> upload the container to the docker hub (internal only)'
	@echo '                                 (this will re-tag the container appropriately)'
	@echo 'make pki_server/run       -> run the container from the docker hub'
	@echo 'make pki_server/run-local -> run the container locally (for bootstrapping)'
	@echo 'make pki_server/logs      -> tail the logs of a running pki server'
	@echo 'make pki_server/stop      -> stop the pki server'
	@exit 0

include Makefile.d/*.mk

pki_server/stop:
	@echo "$@ running"
	docker kill $(PKI_SERVER_DOCKER_CONTAINER_NAME)
	@echo "$@ done"
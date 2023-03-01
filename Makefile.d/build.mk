pki_server/build:
	@echo "$@ starting."
	docker build --tag $(PKI_SERVER_DOCKER_IMAGE_NAME) .
	@echo "$@ completed."

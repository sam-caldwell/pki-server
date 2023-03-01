pki_server/logs:
	@echo "$@ starting..."
	docker logs -f $(PKI_SERVER_DOCKER_CONTAINER_NAME)
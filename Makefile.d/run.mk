pki_server/initialize:
	@echo "$@ starting"
	mkdir -p $(PKI_SERVER_VOLUME) || true
	@echo "$@ completed"

.$PHONY: pki_server/run
REMOTE_IMAGE:=$(DOCKER_HUB)/$(PKI_SERVER_DOCKER_IMAGE_NAME)
pki_server/run: pki_server/initialize
	@echo "$@ starting."
	docker run -d \
			   --rm \
			   --name $(PKI_SERVER_DOCKER_CONTAINER_NAME) \
			   --publish $(PKI_SERVER_IP_ADDRESS):$(PKI_SERVER_PORT):80 \
			   --volume $(PKI_SERVER_VOLUME):/var/www/html/ $(REMOTE_IMAGE) .
	@echo "$@ completed."

.$PHONY: pki_server/run/local
LOCAL_IMAGE:=$(PKI_SERVER_DOCKER_IMAGE_NAME)
pki_server/run/local: pki_server/initialize
	@echo "$@ starting."
	docker run -d \
			   --rm \
			   --name $(PKI_SERVER_DOCKER_CONTAINER_NAME) \
			   --publish $(PKI_SERVER_IP_ADDRESS):$(PKI_SERVER_PORT):80 \
			   --volume $(PKI_SERVER_VOLUME):/var/www/html/ $(LOCAL_IMAGE) .
	@echo "$@ completed."

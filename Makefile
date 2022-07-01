up:
	docker-compose up -d
	make bash

stop:
	docker-compose stop

bash:
	docker exec -it rsa_app_1  /bin/bash

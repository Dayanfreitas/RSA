setup:
	cp private.txt.exemplo private.txt
	cp public.txt.exemplo public.txt
	cp file.txt.exemplo file.txt

up:
	docker-compose up -d
	make bash

stop:
	docker-compose stop

bash:
	docker exec -it rsa_app_1  /bin/bash

clean:
	rm private.txt
	rm public.txt
	rm file.txt
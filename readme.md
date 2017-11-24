Usage:

	1. First Enter Container
		sudo docker run -it wt-web-docker:v1.0 /bin/bash

	2. Enter Exited Container
		sudo docker ps -a
		sudo docker start -ia 57c5d096ec6b

	3. Build Wt
		rm -rf builds && mkdir builds && cd builds && cmake ../ && make -j8
		sudo make install


Reference:

Create Image:

	cd wt-web-docker/

	sudo docker build -t wt-web-docker:v1.0 .

List Images:

	sudo docker images

Remeve Image:

	sudo docker rmi 7d9495d03763

	sudo docker image remove 7d9495d03763

Run Container:

	sudo docker-compose up -d

List Containers:

	sudo docker ps

	sudo docker ps -a

Remove Container:

	sudo docker rm d48b68282c03

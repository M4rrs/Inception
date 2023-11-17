SRCS = ./srcs/docker-compose.yml
BUILD = docker-compose -f

#-------------------------------------------------------------------#
b:
	mkdir -p $(HOME)/data/mariadb
	mkdir -p $(HOME)/data/wordpress
	${BUILD} ${SRCS} build

r:
	${BUILD} ${SRCS} up -d

run: b r

end:
	${BUILD} ${SRCS} down
	
reset: end fclean

#-------------------------------------------------------------------#
start:
	${BUILD} ${SRCS} start

stop:
	${BUILD} ${SRCS} stop

#-------------------------------------------------------------------#
clean:
	docker system prune -f
	
fclean:
	docker system prune --all -f

re: end fclean run

# Lists the services in docker-compose.yml
ps:
	docker ps -a

#-------------------------------------------------------------------#

db:
	docker exec -it mariadb bash

ng:
	docker exec -it nginx bash

wp:
	docker exec -it wordpress bash
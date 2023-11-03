SRCS = ./srcs/docker-compose.yml

#-------------------------------------------------------------------#
build:
	docker-compose -f ${SRCS} up --build

end:
	docker-compose -f ${SRCS} down

#-------------------------------------------------------------------#
start:
	docker-compose -f ${SRCS} start

stop:
	docker-compose -f ${SRCS} stop

#-------------------------------------------------------------------#
fclean:
	docker system prune --all -f

re: stop fclean run

# Lists the services in docker-compose.yml
ps:
	docker compose -f ${SRCS} ps
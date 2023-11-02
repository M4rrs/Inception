#-------------------------------------------------------------------#
run:
	docker-compose -f ./srcs/docker-compose.yml up --build

end:
	docker-compose -f ./srcs/docker-compose.yml down

#-------------------------------------------------------------------#
start:
	docker-compose -f ./srcs/docker-compose.yml start

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

#-------------------------------------------------------------------#
fclean:
	docker system prune --all -f

re: stop fclean run

# Lists the services in docker-compose.yml
ps:
	docker compose -f ./srcs/docker-compose.yml ps
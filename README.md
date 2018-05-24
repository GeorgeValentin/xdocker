# xdocker
docker tool for my development...

### note

```bash

#build image
docker build -t xxx/server:1.7.0 .

#run container with the image and attach bash shell for debug (auto clear up on exit)
docker run -v ~/project/LOAM2/Code/en/branches/1.6.3/server:/data/loris  -it --rm xxx/server:1.6.3 /bin/bash

# start all services
docker-compose up 

# start all services background
docker-compose up -d

#stop services and clean up containers
docker-compose down 

# start single service
docker-compose up -d server_0101 

# start single service background
docker-compose up -d server_0101

# start stop restart single service
docker-compose [start stop restart] server_0101

# start single service with color log
docker-compose run --service-ports  server_0101  #NOTE# DO NOT USE UP AND RUN ON THE SAME TIME because denpends_on problem

```

### AFQ

1. how to remove all the none name containers ？

```bash

docker stop $(docker ps -a | grep "Exited" | awk '{print $1 }')

docker rm $(docker ps -a | grep "Exited" | awk '{print $1 }')

docker rmi $(docker images | grep "none" | awk '{print $3}')

```

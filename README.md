# dock-lab5

## How to run:

1. `docker build --build-arg VERSION=1.0 -t part2:1.0 .`

2. `docker run -d -p 3000:8888 part2:1.0`

## Check 

to confirm that the container is running you can do 

`docker ps`

## Working

The app is running on port 3000 and you can access it on http://localhost:3000

#!/bin/bash

protoc -I/usr/local/include -I. \
		--go_out=plugins=micro:. \
		proto/vessel/vessel.proto

 
docker build -t  shippy-vessel-service:latest .
#docker push renegmedal/shippy-vessel-service:latest

docker run --net="host" \
		-p 50053 \
		-e MICRO_SERVER_ADDRESS=:50053 \
		-e MICRO_REGISTRY=mdns \
		shippy-vessel-service

 


#!/bin/bash
 
protoc -I .  proto/vessel/vessel.proto \
   --go_out=plugins=micro:${GOPATH}/src/github.com/renegmed/shippy-vessel-service
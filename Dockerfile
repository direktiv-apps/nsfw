FROM golang:1.18.2-alpine as build

WORKDIR /src

COPY build/app/go.mod go.mod
COPY build/app/go.sum go.sum

RUN go mod download

COPY build/app/cmd cmd/
COPY build/app/models models/
COPY build/app/restapi restapi/

ENV CGO_LDFLAGS "-static -w -s"

RUN go build -tags osusergo,netgo -o /application cmd/nsfw-server/main.go; 

# FROM python:3.12.0a5-slim-buster
# FROM ubuntu:22.04

FROM tensorflow/tensorflow:2.11.0

RUN apt-get update && apt-get install wget ca-certificates unzip -y
# RUN apt-get install python3 python3-pip -y

# get model
RUN wget https://github.com/GantMan/nsfw_model/releases/download/1.1.0/nsfw_mobilenet_v2_140_224.zip
RUN unzip nsfw_mobilenet_v2_140_224.zip && mv mobilenet_v2_140_224 /var

# get tensorflow and nsfw detector
RUN python3 -m pip install --upgrade pip
RUN pip install --upgrade pip nsfw-detector

COPY verify.py /

COPY logo.png /

# DON'T CHANGE BELOW 
COPY --from=build /application /bin/application

EXPOSE 8080

CMD ["/bin/application", "--port=8080", "--host=0.0.0.0", "--write-timeout=0"]
#!/bin/sh

docker build -t nsfw . && docker run -p 9191:8080 nsfw
#!/bin/bash

docker run -it  -p 8083:8083 -v /var/www/openresty:/var/www/openresty openresty:v1 bash
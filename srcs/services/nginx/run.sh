#!/bin/bash

# Start Nginx
nginx -g "daemon off;"

# Keep container running indefinitely
while true; do
    sleep 3600
done


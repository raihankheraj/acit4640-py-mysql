#!/bin/sh

echo "[database]
MYSQL_HOST = $MYSQL_HOST
MYSQL_PORT = 3306
MYSQL_DB = $MYSQL_DATABASE
MYSQL_USER = $MYSQL_USER
MYSQL_PASSWORD = $MYSQL_PASSWORD" > ./backend.conf

# Abort if any errors, including wait-for-it 
set -m

# Wait for the backend to be up
if [ -n "$MYSQL_HOST" ]; then
  wait-for-it --timeout=30 "$MYSQL_HOST:${MYSQL_PORT}"
fi

gunicorn wsgi:app -b 0.0.0.0:8000 &

wait-for-it -h localhost -p 8000 -t 0 -- hostname

curl -X POST ${BACKEND_URL}/add -H "Content-Type: application/json" -d '{"name": "Raihan", "bcit_id": "A01196507"}'

fg %1
# Run the main container command
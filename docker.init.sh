#!/bin/bash

if ! command -v docker-compose &> /dev/null; then
  echo "docker-compose is not installed"
  exit 1
fi

cd /srv/config && docker-compose stop && docker-compose down && docker-compose up --build --detach --force-recreate;
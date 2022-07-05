# chia-dashboard-docker

A docker image for chia-dashboard-core

## Usage

docker-compose

```yaml
version: '3.1'

services:

  mongo:
    image: mongo:4
    restart: always
    environment:
      MONGO_INITDB_ROOT_USERNAME: root
      MONGO_INITDB_ROOT_PASSWORD: example

  dashboard:
    image: echo094/chia-dashboard-docker
    restart: always
    ports:
      - 5000:5000
    environment:
      DATABASE_URL: ''
      JWT_SIGNING_SECRET: ''
      GOOGLE_CLIENT_ID: ''
      GOOGLE_CLIENT_SECRET: ''
```

## TODO

Integrate chia-dashboard-ui

[ ! -f .env ] && cp example.env .env || echo '.env file already exists'
# list existing docker volumes
docker volume ls
docker volume create cargo_cache

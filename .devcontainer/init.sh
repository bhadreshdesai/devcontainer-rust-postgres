[ ! -f .env ] && cp example.env .env || echo '.env file already exists'
# list existing docker volumes
echo Existing docker volumes - start
docker volume ls
echo Existing docker volumes - end
docker volume create cargo_cache

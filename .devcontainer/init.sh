[ ! -f .env ] && cp example.env .env || echo '.env file already exists'
docker volume create cargo_cache
[ ! -f .env ] && cp example.env .env || echo '.env file already exists'
# list existing docker volumes
echo Existing docker volumes - start
docker volume ls
echo Existing docker volumes - end
docker volume create cargo_cache

# Generate docker-compose.devcontainer.yaml from template using the workspace folder name
export PROJECT="$1"
envsubst '${PROJECT}' < .devcontainer/docker-compose.devcontainer.yaml.template > .devcontainer/docker-compose.devcontainer.yaml
echo "Generated docker-compose.devcontainer.yaml for project: $PROJECT"

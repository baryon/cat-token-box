git pull -r --autostash
docker image prune --all --force

git switch main

sudo chmod 777 -R docker/data
sudo chmod 777 -R docker/pgdata
sudo chmod 777 -R docker/log

# cp .env.production .env
docker compose -f docker-compose.yml build
docker compose -f docker-compose.yml up -d

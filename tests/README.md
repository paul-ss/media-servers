# Apply states inside docker container

shell> docker compose run -d --rm --service-ports app

shell> docker compose exec app bash

shell> docker compose kill app

container-shell$> salt-call -c /home/configs --file-root /home/salt/states/ --pillar-root /home/salt/pillar state.apply ssh

# Apply states inside docker container

$> docker compose run --rm app

container-shell$> salt-call -c /home/configs --file-root /home/salt/states/ --pillar-root /home/salt/pillar state.apply ssh

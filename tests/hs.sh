#!/bin/bash

salt-call -c /home/configs --file-root /home/salt/states/ --pillar-root /home/salt/pillar state.apply ssh
  
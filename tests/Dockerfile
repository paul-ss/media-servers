FROM ubuntu:22.04
RUN apt-get update -y && apt-get install curl coreutils init -y && \
    curl -fsSL -o /etc/apt/keyrings/salt-archive-keyring.gpg https://repo.saltproject.io/salt/py3/ubuntu/22.04/amd64/SALT-PROJECT-GPG-PUBKEY-2023.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/salt-archive-keyring.gpg arch=amd64] https://repo.saltproject.io/salt/py3/ubuntu/22.04/amd64/latest jammy main" | tee /etc/apt/sources.list.d/salt.list && \
    apt-get update -y && \
    apt-get install salt-minion -y

COPY hs.sh /bin/hs

EXPOSE 22

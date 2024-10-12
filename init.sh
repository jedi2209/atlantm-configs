#!/bin/bash

DEFAULT_DIR='/srv';

WWW_DIR='/www';
DOCKER_DIR='/docker';
CONFIG_DIR='/config';

sudo apt update -y; sudo apt upgrade -y; sudo apt install -y mc git zsh ncdu docker mysql-client ca-certificates curl gpg lynx gnupg lsb-release screen s3cmd software-properties-common; \
sudo rm -rf /usr/share/keyrings/docker-archive-keyring.gpg; curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg; \
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg; gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint; \
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list; \
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null; \
sudo apt-get update -y; sudo ufw allow openssh; sudo ufw allow ftp; sudo service ufw restart; \
ssh-keygen -t ed25519 -C "atlantm@YaCloud" -f ~/.ssh/id_ed25519 -P ''; \
sudo usermod -a -G www-data atlantm; \
sudo mkdir ${DEFAULT_DIR}${WWW_DIR}; sudo mkdir ${DEFAULT_DIR}${DOCKER_DIR}; sudo mkdir ${DEFAULT_DIR}${CONFIG_DIR}; \
sudo chown atlantm:www-data ${DEFAULT_DIR}${CONFIG_DIR}; sudo chown atlantm:www-data ${DEFAULT_DIR}${WWW_DIR}; \
echo $(cat ~/.ssh/id_ed25519.pub); \
read -p "Add this key to read-only repo and press Enter..."; \
git clone git@bitbucket.org:zavarkateam/atlantm-config.git ${DEFAULT_DIR}${CONFIG_DIR}; \
sudo chmod 0600 ${DEFAULT_DIR}${CONFIG_DIR}/logrotate.conf; sudo chown root:root ${DEFAULT_DIR}${CONFIG_DIR}/logrotate.conf; \
mkdir ~/.mysql && \
wget "https://storage.yandexcloud.net/cloud-certs/CA.pem" -O ~/.mysql/root.crt && \
chmod 0600 ~/.mysql/root.crt
cd /srv/config; docker-compose up --no-start; docker-compose restart && crontab cron/crontab;

sudo mount -t virtiofs api ${DEFAULT_DIR}${WWW_DIR}/xxx.com/public_html/mnt_files;
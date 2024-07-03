#!/bin/bash

DEFAULT_DIR='/srv';

WWW_DIR='/www';
DOCKER_DIR='/docker';
CONFIG_DIR='/config';

sudo apt update -y; sudo apt upgrade -y; sudo apt install -y mc git zsh ncdu docker mysql-client ca-certificates curl lynx gnupg lsb-release screen s3cmd software-properties-common; \
sudo rm -rf /usr/share/keyrings/docker-archive-keyring.gpg; curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg; \
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -; sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"; \
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null; \
sudo apt-get update -y; sudo apt-get install -y docker-ce docker-ce-cli terraform containerd.io docker-compose-plugin docker-compose; \
sudo ufw allow openssh; sudo ufw allow ftp; sudo service ufw restart; \
ssh-keygen -t ed25519 -C "atlantm@YaCloud" -f ~/.ssh/id_ed25519 -P ''; \
sudo usermod -a -G www-data atlantm; \
terraform -install-autocomplete; \
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
cd ~; curl -sSL https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash;

sudo mount -t virtiofs api ${DEFAULT_DIR}${WWW_DIR}/xxx.com/public_html/mnt_files;

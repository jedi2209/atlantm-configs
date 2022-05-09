sudo apt update -y; sudo apt upgrade -y; sudo apt install -y mc git vsftpd docker ca-certificates curl lynx gnupg lsb-release; \
sudo rm -rf /usr/share/keyrings/docker-archive-keyring.gpg; curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg; \
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null; \
sudo apt-get update -y; sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin;
ssh-keygen -t ed25519 -C "atlantm@YaCloud" -f ~/.ssh/id_ed25519 -P '';
sudo usermod -a -G www-data atlantm;
sudo mkdir /srv/www/; sudo mkdir /srv/docker/; sudo mkdir /srv/config/;
sudo chown atlantm:www-data /srv/config; sudo chown atlantm:www-data /srv/www;

echo $(cat ~/.ssh/id_ed25519.pub);
read -p "Add this key to read-only repo and press Enter...";
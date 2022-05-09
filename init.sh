sudo apt update -y; sudo apt upgrade -y; sudo apt install -y mc git vsftpd docker ca-certificates curl lynx gnupg lsb-release; \
sudo rm -rf /usr/share/keyrings/docker-archive-keyring.gpg; curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg; \
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null; \
sudo apt-get update -y; sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin;
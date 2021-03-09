







########################################################################
########################################################################
#####
#####           Install Applications
#####
########################################################################
########################################################################

apt-get -y update
apt-get -y install -q \
  build-essential \
  apt-utils \
  net-tools \
  git \
  putty \
  x11-apps \
  openssh-server \
  vim-gnome \
  samba \
  python-setuptools \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg

rm -fr /var/lib/apt/lists/*

#----------------------------------------------------------------
#   Install Docker 
#     (https://docs.docker.com/engine/install/ubuntu/)
#----------------------------------------------------------------
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io
groupadd docker
usermod -aG docker sdr


#----------------------------------------------------------------
#   Create development workspace folder
#----------------------------------------------------------------
mkdir -p ~/workspace
chmod 777 ~/workspace
chown -R sdr:sdr ~/workspace

#----------------------------------------------------------------
#   Configure Samba
#----------------------------------------------------------------
cp /etc/samba/smb.conf /etc/samba/smb.conf.backup
cp ./smb.conf /etc/samba/.
ufw allow samba
smbpasswd -a sdr
ufw allow samba

#----------------------------------------------------------------
#   Configure SSH
#----------------------------------------------------------------
cp /etc/ssh/ssh_config /etc/ssh/ssh_config.backup
cp ./ssh_config /etc/ssh/ssh_config
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup
cp ./sshd_config /etc/ssh/sshd_config

#----------------------------------------------------------------
#   Configure GVim
#----------------------------------------------------------------
cp ./_gvimrc ~/.gvimrc


#----------------------------------------------------------------
#   Configure BASH Shell
#----------------------------------------------------------------
echo -e "\n\n# Add some more ls aliases" | tee -a ~/.bashrc
echo "alias ll='ls -alF'" | tee -a ~/.bashrc
echo "alias la='ls -A'" | tee -a ~/.bashrc 
echo "alias l='ls -al'" | tee -a ~/.bashrc 
echo "alias vi='gvim'"  | tee -a ~/.bashrc 


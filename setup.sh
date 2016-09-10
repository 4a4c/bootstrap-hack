#Variables
NEW_HOSTNAME=bootstrap

#set hostname
echo "setting hostname to ${NEW_HOSTNAME}"
sudo hostnamectl set-hostname ${NEW_HOSTNAME}

#clone network boot repo
mkdir -p networkboot
git clone https://github.com/networkboot/docker-dhcpd ./networkboot/docker-dhcp/

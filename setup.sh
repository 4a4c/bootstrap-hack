#Variables
NEW_HOSTNAME=bootstrap

#set hostname
echo "setting hostname to ${NEW_HOSTNAME}"
sudo hostnamectl set-hostname ${NEW_HOSTNAME}

#clone network boot repo
echo "cloning networkboot/docker-dhcp repo"
if [ ! -d "networkboot" ]; then
	mkdir -p networkboot
	git clone https://github.com/networkboot/docker-dhcpd ./networkboot/docker-dhcp/
fi

#build dhcpd container
echo "building docker-dhcp container"
./networkboot/docker-dhcp/build



#Variables
NEW_HOSTNAME=bootstrap

#set hostname
echo "setting hostname to ${NEW_HOSTNAME}"
sudo hostnamectl set-hostname ${NEW_HOSTNAME}

#set static ip
echo "setting static ip"
echo "please re-run this setup script after rebooting the machine and logging back in"
if [ ! -f /etc/systemd/network/10-static.network ]; then
	sudo cp ./includes/10-static.network /etc/systemd/network/
	sudo systemctl restart systemd-networkd
	exit
fi

#clone network boot repo
echo "cloning networkboot/docker-dhcp repo"
if [ ! -d "networkboot" ]; then
	mkdir -p networkboot
	git clone https://github.com/networkboot/docker-dhcpd ./networkboot/docker-dhcp/
fi

#build dhcpd container
echo "building docker-dhcp container"
./networkboot/docker-dhcp/build

#setup dhcpd service
echo "setting up dhcpd service"
if [ ! -f /etc/systemd/system/dhcpd.service ]; then
	sudo cp ./includes/dhcpd.service /etc/systemd/system/
	sudo systemctl enable dhcpd
	sudo systemctl start dhcpd
fi
systemctl status dhcpd

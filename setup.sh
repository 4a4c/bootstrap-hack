#Variables
NEW_HOSTNAME=bootstrap

#set hostname
echo "setting hostname to ${NEW_HOSTNAME}"
sudo hostnamectl set-hostname ${NEW_HOSTNAME}


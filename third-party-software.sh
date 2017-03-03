# Nitro tasks
echo "Nitro Tasks...\n"
URL='http://ppa.launchpad.net/cooperjona/nitrotasks/ubuntu/pool/main/n/nitrotasks/nitrotasks_1.5.1_all.deb'
wget "$URL" -qO $FILE && sudo dpkg -i $FILE

rm $FILE

# Playonlinux
echo "Playonlinux...\n"
URL='https://www.playonlinux.com/script_files/PlayOnLinux/4.2.9/PlayOnLinux_4.2.9.deb'
wget "$URL" -qO $FILE && sudo dpkg -i $FILE

rm $FILE

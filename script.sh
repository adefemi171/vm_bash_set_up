#!/bin/bash
#!/bin/bash -x
echo "This script is written to work with Ubuntu Distro"

sleep 3

echo "Update and Upgrade the APT repository"
sudo apt-get update && sudo apt-get upgrade -y
echo

sudo apt install openjdk-8-jdk openjdk-8-jre -y

sleep 3

cat >> /etc/environment <<EOL
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
JRE_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
EOL

wget https://downloads.tableau.com/esdalt/2020.4.7/tableau-tabcmd-2020-4-7_all.deb

sleep 5

sudo apt-get install ./tableau-tabcmd-2020-4-7_all.deb

sleep 5

source /etc/profile.d/tabcmd.sh

sleep 3

sudo /opt/tableau/tabcmd/bin/tabcmd --accepteula

sleep 3

echo 'Accepted Eula License'
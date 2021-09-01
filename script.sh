#!/bin/bash
#!/bin/bash -x
echo "This script is written to work with Ubuntu Distro"

sleep 3

echo "Update and Upgrade the APT repository"
sudo apt-get update && sudo apt-get upgrade -y
echo

sudo apt install openjdk-8-jdk openjdk-8-jre -y

sleep 3

# installing application to send mail
sudo apt-get install mailutils -y

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

echo 'Enter the Tableau  server link (eg: http://tableauserver:80) ': 
read varServer

echo 'Enter your Tableau Username (eg: admin ) ': 
read varUsername

echo 'Enter your Tableau Password (eg: password ) ': 
read -s varPassword

tabcmd login -s $varServer -u $varUsername -p $varPassword

sleep 5

echo 'URL of View (eg: /views/Wow/SummaryReports.pdf): '
read -p " " varUrlView

echo Enter chosen file name: 
read -s varFilename

echo 'Enter file name with extension (eg: progressReport.pdf): '
read -p " " varFilename

tabcmd get "$varUrlView" -f "$varFilename"
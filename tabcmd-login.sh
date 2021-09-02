#!/bin/bash
#!/bin/bash -x
echo "This script will log you into tableau server"

echo 'Enter the Tableau  server link (eg: http://tableauserver:80) ': 
read varServer

echo 'Enter your Tableau Username (eg: admin ) ': 
read varUsername

echo 'Enter your Tableau Password (eg: password ) ': 
read -s varPassword

sudo /opt/tableau/tabcmd/bin/tabcmd login -s $varServer -u $varUsername -p $varPassword

sleep 5

echo 'URL of View (eg: /views/Wow/SummaryReports.pdf): '
read -p " " varUrlView

echo Enter chosen file name: 
read -s varFilename

echo 'Enter file name with extension (eg: progressReport.pdf): '
read -p " " varFilename

sudo /opt/tableau/tabcmd/bin/tabcmd get "$varUrlView" -f "$varFilename"
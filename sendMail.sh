#!/bin/bash
#!/bin/bash -x
echo "This script install mailutils and send mails"

# installing application to send mail
sudo apt-get install mailutils -y

sleep 3

sudo adduser $USER mail
sleep 3

echo "sample message" | mail -s "sample mail subject" $USER@localhost
sleep 3

sudo chmod ug+rw /var/mail/$USER
sleep 3

echo 'Enter email Body : '
read -p " " body

echo 'Enter Sender email to send file : '
read -p " " emailSender

echo 'Enter email Subject to send file : '
read -p " " subject

echo 'Enter receiver email 1 to receive file : '
read -p " " emailReceiver1

echo 'Enter receiver email 2 to receive file : '
read -p " " emailReceiver2

# echo 'Enter receiver email 3 to receive file : '
# read -p " " emailReceiver3

echo "$body" | mail -r $emailSender -s "$subject" -A "$varFilename" $emailReceiver1,$emailReceiver2
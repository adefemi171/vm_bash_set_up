#!/bin/bash
#!/bin/bash -x

echo "Update ubuntu repository"
sudo apt update && sudo apt upgrade -y


echo "Install Node.js"
sudo apt install nodejs -y 

echo "Install Nginx/apache"
sudo apt install nginx -y
sudo apt install apache -y

echo "Create a folder for the application"
cd /var/www/html/
sudo git clone <github_url_link>

echo "GIVE OWNERSHIP OF FOLDER TO USER"
sudo chown $USER:$USER /var/www/html/{project name}

echo "GIVE WRITE PERMISSION"
sudo chmod -R 777 /var/www/html/{project name}



echo "change directory to the application folder"
cd /var/www/html/{project name}

echo "build the node application"
sudo npm run build

OR

sudo yarn build


echo "edit the config file fr the application"
cd /etc/nginx/sites-available/

touch /etc/nginx/sites-available/{project name}

sudo nano /etc/nginx/sites-available/{project name}


###########
server {

    listen 80;
    listen [::]:80;

    server_name example.com;

    root /var/www/html/{project name}/build;
    index index.html;

    location / {
            try_files $uri $uri/ =404;
    }
}

echo "Enable the file by creating a link from it to the sites-enabled directory, which Nginx reads from during startup"
sudo ln -s /etc/nginx/sites-available/{project name} /etc/nginx/sites-enabled/

echo "Test nginx"
sudo nginx -t

echo "RESTART NGINX SERVER"
sudo systemctl restart nginx



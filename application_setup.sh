#!/bin/bash
#!/bin/bash -x

echo "Update ubuntu repository"
sudo apt update && sudo apt upgrade -y


echo "Install Node.js"
d ~
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs -y

rm nodesource_setup.sh


## You may also need development tools to build native addons:
sudo apt-get install gcc g++ make -y
## To install the Yarn package manager, run:
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn -y


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



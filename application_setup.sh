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

echo "edit the config file fr the application"
cd /etc/nginx/sites-available/
cat /etc/nginx/sites-available/{project name}
sudo nano /etc/nginx/sites-available/{project name}

###########
# server {

#     listen 80;
#     listen [::]:80;

#     server_name example.com;

#     root /var/www/example.com;
#     index index.html;

#     location / {
#             try_files $uri $uri/ =404;
#     }
# }

server {
        server_name example.com;

        location / {
                proxy_pass http://localhost:<port_number>;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection 'upgrade';
                proxy_set_header Host $host;
                proxy_cache_bypass $http_upgrade;
        }

        location ~ /\.git {
            deny all;
        }

        access_log /var/log/nginx/api.access.log;
        error_log /var/log/nginx/api.error.log;

}

echo "Enable the file by creating a link from it to the sites-enabled directory, which Nginx reads from during startup"
sudo ln -s /etc/nginx/sites-available/{your_domain} /etc/nginx/sites-enabled/

echo "Test nginx"
sudo nginx -t

echo "RESTART NGINX SERVER"
sudo systemctl restart nginx

echo "OR BUILD THE APPLICATION"

echo "change directory to the application folder"
cd /var/www/html/{project name}

echo "build the node application"
sudo npm run build
sudo yarn build

echo "edit the config file fr the application"
cat /etc/nginx/sites-available/{project name}
sudo nano /etc/nginx/sites-available/{project name}

###########
server {

    listen 80;
    listen [::]:80;

    server_name example.com;

    root /var/www/example.com/build;
    index index.html;

    location / {
            try_files $uri $uri/ =404;
    }
}
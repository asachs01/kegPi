#!/bin/sh

sudo apt-get update 
sudo apt-get upgrade -y
sudo apt-get install ruby ruby-dev libffi-dev libssl-dev
sudo gem install sensu

sudo mkdir -p /etc/sensu/conf.d

sudo useradd sensu

# Create a minimal client
echo '{
"client": {
   "environment": "development",
   "subscriptions": [
      "dev"       
   ]  
 }
}' | sudo tee /etc/sensu/conf.d/client.json

# Create a transport config 
# NOTE: All of the credentials here SHOULD be changed
echo '{                    
  "rabbitmq": {      
    "host": "127.0.0.1",                   
    "port": 5672,    
    "vhost": "/sensu",                     
    "user": "sensu", 
    "password": "secret",                  
  }                  
} ' | sudo tee /etc/sensu/conf.d/rabbitmq.json                  

# Change some permissions
sudo chown -r sensu. /etc/sensu

# Creating our systemd unit file
echo '[Unit]
Description=sensu client

[Service]
User=sensu
Group=sensu
ExecStart=/usr/local/bin/sensu-client
KillMode=process
Restart=on-failure
RestartSec=1min

[Install]
WantedBy=multi-user.target' | sudo tee /etc/systemd/system/sensu-client.service

# Start and enable the service
sudo systemctl start sensu-client

sudo systemctl enable sensu-client



#!/bin/bash
sudo apt update
sudo apt install apache2 -y
echo '<h1><center>Super Awesome Test Website</center></h1>' > index.html
sudo mv index.html /var/www/html
sudo systemctl start apache2 && sudo systemctl enable apache2

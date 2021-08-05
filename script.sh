#!/bin/bash
sudo apt install apache2 -y
echo '<h1><center>My Test Website With Help From Terraform Provisioner</center></h1>' > index.html
sudo mv index.html /var/www/html
sudo systemctl start apache2 && sudo systemctl enable apache2

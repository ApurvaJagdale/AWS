#!/bin/bash

# Script to Install Apache HTTP Server and Deploy the Template on an EC2 Instance

# Install Apache HTTP server
yum install httpd -y

# Start the Apache service
systemctl start httpd

# Enable Apache to start on boot
systemctl enable httpd

# Download the ZIP file
curl -o /root/browny.zip https://www.free-css.com/assets/files/free-css-templates/download/page296/browny.zip

# Install unzip if not already installed
yum install unzip -y

# Unzip the downloaded file
unzip /root/browny.zip -d /tmp/browny

# Move the extracted files to the web server's document root
mv /tmp/browny/browny-v1.0/* /var/www/html/

# Ensure correct permissions and ownership
chown -R apache:apache /var/www/html/
chmod -R 755 /var/www/html/

# Restart Apache to apply changes
systemctl restart httpd

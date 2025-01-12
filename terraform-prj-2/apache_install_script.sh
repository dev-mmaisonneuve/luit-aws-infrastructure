#!/bin/bash
# Update all packages
apt-get update -y
apt-get upgrade -y

# Install Apache web server
apt-get install -y apache2

# Start Apache service
systemctl start apache2
systemctl enable apache2

# Create a custom HTML page with colors
echo "<html>
        <head>
            <style>
                body {
                    background-color: #f0f8ff; /* Light blue background */
                }
                h1 {
                    color: #ff6347; /* Tomato red color */
                    text-align: center; /* Center the text */
                    font-family: Arial, sans-serif; /* Set font to Arial */
                    font-size: 50px; /* Increase font size */
                }
            </style>
        </head>
        <body>
            <h1>Welcome to LUIT</h1>
        </body>
      </html>" > /var/www/html/index.html

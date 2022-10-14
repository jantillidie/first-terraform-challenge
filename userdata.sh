#!/bin/bash
echo "start install"
yum update -y
echo "install webserver"
yum install httpd
systemctl enable httpd
systemctl start httpd
echo "<!DOCTYPE html>
      <html lang="en">
      <head>
          <meta charset="UTF-8">
          <title>Placepaca</title>
      </head>
      <style>
          html,body {
              height: 100%;
              background-color: #5d855d;
          }
          img {
              border-radius: 100px;
              position: absolute;
              top: 10px;
              left: 10px;
              transition: transform 1s;
          }
      </style>
      <body>
          <img id="alpaca" src="https://images.placepaca.com/Alpaka_10.jpg" width="100"/>
          <p>
              click to place alpaca
          </p>
      </body>
      <script>
          const alpaca = document.getElementById('alpaca');
          document.addEventListener('click', function(ev){
              alpaca.style.transform = 'translateY('+(ev.clientY-25)+'px)';
              alpaca.style.transform += 'translateX('+(ev.clientX-25)+'px)';
          },false);
      </script>
      </html>" > /var/www/html/index.html
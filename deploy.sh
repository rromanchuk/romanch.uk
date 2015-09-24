#!/bin/sh
slimrb -p index.slim > dist/index.html
sass  app.scss > dist/css/app.css
s3_website push


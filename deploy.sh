#!/bin/sh
slimrb -p index.slim > dist/index.html
s3_website push


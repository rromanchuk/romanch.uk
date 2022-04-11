#!/bin/bash
set -e

source ~/.bashrc

cd /var/www/romanch.uk/codedeploy
bin/rails db:migrate
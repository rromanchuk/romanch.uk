# ryanromanchuk.com

### Prerequisites

```bash
brew install rbenv
brew install ruby-build
brew install puma/puma/puma-dev
brew install overmind
brew install tmux
brew install yarn
brew install jq

# Configure some DNS settings that have to be done as root
sudo puma-dev -setup
# Configure puma-dev to run in the background on ports 80 and 443 with the domain `.test`.
puma-dev -install

rbenv install 3.1.0
gem install bundler
bin/update_awscli
cp .env.example .env
```
#### Local

```bash
yarn install
puma-dev link -n personal personal/

cd personal && bundle install
bin/rails db:create && bin/rails db:migrate

# Start local environment, tail -f 
bin/dev

# Restart local puma
touch tmp/restart.txt

# Deploy
bin/deploy

# Non assets pipline 
bin/upload-external

# Update ec2 iam profile
bin/update_iam_role

# Connect
bin/connect

# Create AMI, update launch template, update default, trigger instance refresh on ASG
bin/create_ami

# Test
bin/rails test
```

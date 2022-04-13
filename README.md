# ryanromanchuk.com

### Prerequisites

```bash
brew install rbenv
brew install ruby-build
brew install puma/puma/puma-dev
brew install overmind
brew install tmux

# Configure some DNS settings that have to be done as root
sudo puma-dev -setup
# Configure puma-dev to run in the background on ports 80 and 443 with the domain `.test`.
puma-dev -install

rbenv install 3.1.0
gem install bundler
```
#### Local

```
yarn install
```

```bash
puma-dev link -n personal personal/
```

```bash
bundle install
bin/dev

bin/rails db:create && bin/rails db:migrate

# Restarting
touch tmp/restart.txt
```
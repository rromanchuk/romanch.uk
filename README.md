# romanch.uk
[![Tests](https://github.com/rromanchuk/ryanromanchuk.com/actions/workflows/tests.yml/badge.svg)](https://github.com/rromanchuk/ryanromanchuk.com/actions/workflows/tests.yml)
[![CodeQL](https://github.com/rromanchuk/ryanromanchuk.com/actions/workflows/codeql-analysis.yml/badge.svg)](https://github.com/rromanchuk/ryanromanchuk.com/actions/workflows/codeql-analysis.yml)
### Prerequisites

```bash
brew bundle
sudo puma-dev -setup
# Configure puma-dev to run in the background on ports 80 and 443 with the domain `.test`.
puma-dev -install
puma-dev link -n personal personal/

rbenv install 3.1.0
gem install bundler
bin/update_awscli
cp .env.example .env
```


```bash
pushd personal
yarn install
bundle install
bin/rails db:setup
```

Start local environment, including required services
``` 
bin/dev
```

Restart local puma-dev
```
touch tmp/restart.txt
```

Run backend tests
```
bin/rails test
```

Deploy 
``` 
bin/deploy
bin/upload-external
```

Update ec2 iam insance profile role.
```
bin/update_iam_role
```

Connect
```
bin/connect
```

Create AMI, update launch template, update default, trigger instance refresh on ASG
```
bin/create_ami
```




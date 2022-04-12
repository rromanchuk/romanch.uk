# This is automatically loaded when RAILS_ENV, or -e flag is passed as staging.
# Set global defaults, and handle someone running bin/puma outside the context of systemd
# https://github.com/puma/puma#configuration-file

directory '/var/www/romanch.uk/current'

bind 'unix:///home/ubuntu/tmp/sockets/puma.sock'

fork_worker


activate_control_app 'unix:///home/ubuntu/tmp/sockets/pumactl.sock', { auth_token: 'romanch.uk' }

persistent_timeout 75

set :deploy_to,   '/data/rails/pyfmi-2013'
role :web, 'fmi.py-bg.net'
role :app, 'fmi.py-bg.net'
role :db,  'fmi.py-bg.net', :primary => true

set :default_environment, {
  'SITE_HOSTNAME' => 'fmi.py-bg.net',
  'MAILER_FROM' => 'Python FMI <evans@py-bg.net>',
  'MAILER_REPLY_TO' => 'Python FMI <fmi@py-bg.net>',
}
set :deploy_to, "/var/www/ocn/apps/#{application}"

set :user, "www-data"
server "ocn_dev_yst", :app, :web, :db, :primary => true, :whenever => true

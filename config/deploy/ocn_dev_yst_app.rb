set :deploy_to, "/var/www/ocn/apps/#{application}"

set :user, "www-data"
server "uat.bstar.wido.me", :app, :web, :db, :primary => true, :whenever => true

set :asset_env, "RAILS_RELATIVE_URL_ROOT=/#{application}"

set :deploy_to, "/var/www/starcloud/apps/#{application}"

set :user, "www-data"
server "ocn_pro_tvportal", :app, :web, :db, :primary => true, :whenever => true

set :asset_env, "RAILS_RELATIVE_URL_ROOT=/#{application}"

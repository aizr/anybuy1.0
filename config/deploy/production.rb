default_environment["PATH"] = "usr/local/rvm/bin:/home/ubuntu/.rvm/gems/ruby-1.9.3-p392/bin:/home/ubuntu/.rvm/gems/ruby-1.9.3-p392@global/bin:/home/ubuntu/.rvm/rubies/ruby-1.9.3-p392/bin:/home/ubuntu/.rvm/bin:$PATH"

set :domain, "www.anybuy.com.tw"
set :repository, "git@github.com:aizr/anybuy1.0.git"

set :scm, :git
set :branch, "master"

set :user, "webuser"
set :group, "ubuntu"

set :deploy_to, "/var/www/rails"
set :deploy_via, :remote_cache
set :deploy_env, "production"
set :rails_env, "production"

set :scm_verbose, true
set :use_sudo, false


role :app, "#{domain}"
role :web, "#{domain}"
role :db, "#{domain}", :primary => true

namespace :deploy do

  task :symlink_db_yml do
    db_config = "#{shared_path}/config/database.yml.production"
    run "ln -s #{db_config} #{release_path}/config/database.yml"
  end
end

before "bundle:install", "deploy:symlink_db_yml"
after "deploy:restart", "unicorn:restart"
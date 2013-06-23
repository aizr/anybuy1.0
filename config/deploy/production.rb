default_environment["PATH"] = "/home/webuser/.rvm/gems/ruby-1.9.3-p429@3.2.13/bin:/home/webuser/.rvm/gems/ruby-1.9.3-p429@global/bin:/home/webuser/.rvm/rubies/ruby-1.9.3-p429/bin:/home/webuser/.rvm/bin:/root/.rvm/bin:$PATH"

set :domain, "www.anybuy.com.tw"
set :repository, "git@github.com:aizr/anybuy1.0.git"

set :scm, :git
set :branch, "master"

set :user, "webuser"
set :group, "users"

set :deploy_to, "/var/www/rails"
set :deploy_via, :remote_cache
set :deploy_env, "production"
set :rails_env, "production"

set :scm_verbose, true
set :use_sudo, false
set :bundle_dir, "/home/webuser/.rvm/gems/ruby-1.9.3-p429@3.2.13"
set :rvm_gemset, "3.2.13"

role :app, "#{domain}"
role :web, "#{domain}"
role :db, "#{domain}", :primary => true

namespace :deploy do
  task :gemset do
    run "rvm gemset use 3.2.13"
  end

  task :symlink_db_yml do
    db_config = "#{shared_path}/config/database.yml.production"
    run "ln -s #{db_config} #{release_path}/config/database.yml"
  end
end

before "bundle:install", "deploy:symlink_db_yml"
after "deploy:restart", "unicorn:restart"
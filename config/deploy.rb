set :stages, %w(production staging)
set :default_stage, "staging"

require 'capistrano/ext/multistage'
require 'capi/unicorn'

set :application, "castle"
set :rvm_type, :user

set :scm, :git
set :repository,  "git://github.com/kaize/castle.git"

set :use_sudo, false
set :ssh_options, :forward_agent => true
default_run_options[:pty] = true

namespace :deploy do
  desc "Symlinks the database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{release_path}/config/database.yml.sample #{release_path}/config/database.yml"
  end
end

before 'deploy:finalize_update', 'deploy:symlink_db'
after "deploy:restart", "unicorn:stop"
after "deploy:update", "deploy:cleanup"

require 'capistrano_colors'
require 'airbrake/capistrano'

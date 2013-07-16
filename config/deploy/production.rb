set :rails_env, :production
set :branch, :master
set :user, 'dvorec'
set :keep_releases, 5

role :web, '91.201.202.172'
role :app, '91.201.202.172'
role :db,  '91.201.202.172', primary: true

set :deploy_to, "/u/apps/castle"

set :rails_env, :production
set :branch, :master
set :user, 'wwwuser'
set :keep_releases, 5

role :web, '95.104.194.54'
role :app, '95.104.194.54'
role :db,  '95.104.194.54', primary: true

set :deploy_to, "/rest/u/apps/castle"

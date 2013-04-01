job_type :bundle_command, "cd :path && RAILS_ENV=#{environment} bundle exec :task"

set :path, "/u/apps/castle/current"

every 4.hours do
  bundle_command "backup perform -t castle_#{environment} -c config/backup.rb"
end
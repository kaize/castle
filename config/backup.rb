##
# Backup
# Generated Template
#
# For more information:
#
# View the Git repository at https://github.com/meskyanichi/backup
# View the Wiki/Documentation at https://github.com/meskyanichi/backup/wiki
# View the issue log at https://github.com/meskyanichi/backup/issues
#
# When you're finished configuring this configuration file,
# you can run it from the command line by issuing the following command:
#
# $ backup perform -t my_backup [-c <path_to_configuration_file>]

#Backup::Model.new(:castle_production, "Castle backup") do
#  database PostgreSQL do |db|
#    db.name = "castle_production"
#  end

#  sync_with RSync::Local do |rsync|
#    rsync.path = "/data/castle/shared/system_backups/"
#    rsync.mirror = false

#    rsync.directories do |directory|
#      directory.add "public/system/original/"
#      directory.add "public/system/ckeditor_assets/"
#    end
#  end
#
#  compress_with Gzip do |compression|
#    compression.best = true
#    compression.fast = false
#  end
#end

require 'yaml'
RAILS_ENV = ENV['RAILS_ENV'] || 'development'
APP_ROOT = File.expand_path('..', File.dirname(__FILE__))
APP_DB_CONFIG = YAML.load_file(File.join(APP_ROOT, '/config/database.yml'))[RAILS_ENV]

Backup::Model.new("castle_#{RAILS_ENV}", "Castle backup") do
  database PostgreSQL do |db|
    db.name               = APP_DB_CONFIG['database']
    db.username           = APP_DB_CONFIG['username']
    db.password           = APP_DB_CONFIG['password']
    db.host               = APP_DB_CONFIG['host']
  end

  archive :static_files do |archive|
    archive.add '/u/apps/castle/current/public'
  end

  archive :system_files do |archive|
    archive.add '/u/apps/castle/shared/system'
  end

  compress_with Gzip do |compression|
    compression.best = true
    compression.fast = false
  end

  store_with Local do |local|
    local.path = "/u/apps/castle/shared/system_backups/"
    local.keep = 14
  end
end

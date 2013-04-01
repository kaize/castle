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

Backup::Model.new(:castle_staging, "Castle backup") do
  database PostgreSQL do |db|
    db.name               = "castle_staging"
    db.username           = "castle_staging"
    db.password           = "a3matn6vEGvdq2jpr39A"
  end

  compress_with Gzip do |compression|
    compression.best = true
    compression.fast = false
  end

  store_with Local do |local|
    local.path = "/var/tmp/"
    local.keep = 5
  end
end
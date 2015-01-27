# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever


every :day, :at => '12:50am' do
  command "echo \"I am running from cron for revel import!"
  runner "revelproductfetch.rb"
  set :output, '/var/www/apps/12851/current/log/custom_deploy_after_migrate.log'
end

every :day, :at => '07:50am' do
  command "echo \"I am running from cron for revel import!"
  runner "revelproductfetch.rb"
  set :output, '/var/www/apps/12851/current/log/custom_deploy_after_migrate.log'
end

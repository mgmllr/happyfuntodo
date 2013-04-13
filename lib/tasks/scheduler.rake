desc "This task is called by the Heroku scheduler add-on"

task :daily_notification => :environment do
  User.daily_notification
end
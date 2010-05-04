set :application, "oozakazoo"
set :scm, :git
set :user, 'robb'
set :use_sudo, false

task :from_github do
  set :deploy_via, :remote_cache
  set :repository,  "git@github.com:robb-broome/oozakazoo.git"
end

task :from_local do
  set :deploy_via, :copy
  set :copy_cache, true
  set :repository,  "robb@localhost:/Users/robb/work/rails/oozakazoo"
end

set :deploy_to, "/var/www/myapp"

role :web, "ubuntukazoo"                          # Your HTTP server, Apache/etc
role :app, "ubuntukazoo"                          # This may be the same as your `Web` server
role :db,  "ubuntukazoo", :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start {}
#   task :stop {}
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

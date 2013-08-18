set :ssh_options, { :forward_agent => true }

set :application, "clockface"
set :deploy_server, "clockface.headmade.pro"
set :user, "dev"
set :use_sudo, true

set :repository,  "git@github.com:relev/skud.git"
set :scm, :git



set :deploy_via, :copy # Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, deploy_server                          # Your HTTP server, Apache/etc
role :app, deploy_server                         # This may be the same as your `Web` server
role :db,  deploy_server, :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
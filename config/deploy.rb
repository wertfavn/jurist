SSHKit.config.command_map[:rake] = "bundle exec rake"
# config valid only for current version of Capistrano

set :repo_url, 'https://github.com/wertfavn/jurist.git'
set :branch, "master"
set :deploy_to, "/var/www/jurist"
set :application, 'jurist'
set :stages, ["production"]
set :deploy_via, :remote_cache
set :scm, :git
set :keep_releases, 5
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/cloudinary.yml')
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :tests, []

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

namespace :setup do
  
  desc "Upload database.yml file."
  task :upload_yml do
    on roles(:app) do
      execute "mkdir -p #{shared_path}/config"
      upload! "config/database.yml", "#{shared_path}/config/database.yml"
      upload! "config/secrets.yml", "#{shared_path}/config/secrets.yml"
      upload! "config/cloudinary.yml", "#{shared_path}/config/cloudinary.yml"
    end
  end
   
  desc "Create database and database user"
  task :create_mysql_database do
    ask :db_root_password, ''
    ask :db_name, "#{fetch(:application)}_production"
    ask :db_user, fetch(:application)
    ask :db_pass, ''

    on primary fetch(:migration_role) do
      execute "mysql --user=root --password=#{fetch(:db_root_password)} -e \"CREATE DATABASE IF NOT EXISTS #{fetch(:db_name)}\""
      execute "mysql --user=root --password=#{fetch(:db_root_password)} -e \"GRANT ALL PRIVILEGES ON #{fetch(:db_name)}.* TO '#{fetch(:db_user)}'@'localhost' IDENTIFIED BY '#{fetch(:db_pass)}' WITH GRANT OPTION\""
    end
  end
  
  desc "Seed the database."
  task :seed_db do
    on roles(:app) do
      within "#{current_path}" do
        with rails_env: :production do
          execute :rake, "db:seed"
        end
      end
    end
  end  
  
end

namespace :deploy do
 
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Restarts Phusion Passenger
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
 
  after :publishing, :restart
 
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
  
namespace :passenger do
  desc "Restart Application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

end
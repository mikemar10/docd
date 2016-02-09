# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'docd'
set :repo_url, 'git@github.com:mikemar10/docd.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :deploy_to, '/home/docd/docd'
set :scm, :git
set :format, :pretty
set :log_level, :debug
set :keep_releases, 5

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push(
  'config/database.yml', 
  'config/secrets.yml',
  'config/unicorn.rb'
)

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push(
  'log', 
  'tmp/pids', 
  'tmp/cache', 
  'tmp/sockets', 
  'vendor/bundle', 
  'public/system'
)


namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end

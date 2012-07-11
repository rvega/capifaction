require 'subdir'

# SCM settings
_cset(:repository)        { abort "Please specify the ssh url of your git project, set :repository, 'git@github.com:me/my_app.git'" }
_cset :scm,               :git
_cset(:deploy_subdir)     { abort "Please specify the subdirectory of the git repo that will be deployed, set :deploy_subdir, '.'" }
_cset(:scm_username)      { abort "Please specify a valid username for git, set :scm_username, 'my_user'" }

# Deploy server details
_cset(:server)            { abort "Please specify the full url of your Deploy Server, set :server, 'www.my_app.com'" }
server "#{server}",       :app, :web, :db, :primary => true
_cset(:base_deploy_path)  { abort "Please specify a base deploy path where your application is located on webfaction, set :base_deploy_path, '~/webapps/my_app'" }
_cset :deploy_to,         "#{base_deploy_path}"
_cset(:cr_config_path)    { abort "Please specify a path where your database.yml is located, set :base_deploy_path, '~/my_app_config'" }
_cset(:user)              { abort "Please specify a valid ssh username on the deploy server, set :user, 'my_user'" }
_cset :use_sudo,          false

# Specify where binaries and gems are:
default_environment['PATH'] =       "#{base_deploy_path}/bin:$PATH"
default_environment['GEM_HOME'] =   "#{base_deploy_path}/gems"
default_environment['RUBYLIB'] =    "#{base_deploy_path}/lib"
_cset :rake,                        "#{base_deploy_path}/bin/rake"

# Git settings for Capistrano
default_run_options[:pty] = true    # needed for git password prompts
ssh_options[:forward_agent] = true  # http://help.github.com/deploy-with-capistrano/

# Prepare Rails environment
after "deploy:create_symlink",  "deploy:prepare_rails_env"

# Reload nginx
after "deploy:update",          "deploy:reload"

# Apply db migrations
after "deploy",                 "deploy:migrate"



# Custom tasks
namespace :deploy do
  desc "Restart nginx"
  task :restart do
    run "#{deploy_to}/bin/restart"
  end

  desc "Reload nginx"
  task :reload do
    run "#{deploy_to}/nginx/sbin/nginx -p #{deploy_to}/nginx/ -s reload"
  end

  desc "Copy database config"
  task :copy_db_config, :roles => :app do
    run "cp #{cr_config_path}/database.yml #{release_path}/config"
  end

  desc "Refresh gems"
  task :refresh_gems, :roles => :app do
    run "gem install bundler"
    run "cd #{release_path}; bundle install"
  end

  desc "Prepare Rails environment"
  task :prepare_rails_env, :roles => :app do
    copy_db_config
    refresh_gems
  end
end

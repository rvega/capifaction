# Capifaction

Some common Capistrano recipies for Webfaction.

## Installation

Add this line to your application's Gemfile:

    gem 'capifaction', :git => 'git@github.com:VictoryProductions/capifaction.git'

And then execute:

    $ bundle

Or install it yourself manually as:

    $ git clone git@github.com:VictoryProductions/capifaction.git
    $ cd capifaction
    $ gem build capifaction.gemspec
    $ gem install capifaction-0.0.1.gem 

## Recipies

### Restart/Reload nginx
`deploy:restart` and `deploy:reload` where prepared for this.

`deploy:restart` is called after `deploy:update`

### Copying database config file
If `config_path` is present, it will look for `database.yml` and copy it
to the proper location on the release path.

`deploy:copy_db_config` is run after creating the current symlink of `deploy:update`.

### DB migrations
Overrides the default Capistrano version, adapted to the webfaction environment.

`deploy:migrate` is run after a full `deploy`.

### Seeds
Doing `deploy:seed` will execute `rake db:seed`.

### Bundle install
`deploy:refresh_gems` updates the gems of the release path by doing a
`bundle install` on the Rails production environment.

Run after creating the current symlink of `deploy:update`.


## Usage

On `config/deploy.rb` include these sample configuration variables:

```ruby
set :application,     "Application name"

set :repository,      "git@github.com:account/repo.git"
set :deploy_subdir,   "subdir_on_repo"
set :scm_username,    "my_username"

set :server_url,        "www.myserver.com"
set :user,              "ssh_username_on_server"
set :base_deploy_path,  "~/base_path_to_install"
set :config_path,       "~/additional_config_files_path" # database.yml
```

## References

* [Capistrano Tasks](https://github.com/capistrano/capistrano/wiki/Capistrano-Tasks)
* [Configuration Variables](https://github.com/capistrano/capistrano/wiki/2.x-Significant-Configuration-Variables)
* [Capistrano Variables](http://theadmin.org/articles/capistrano-variables/)

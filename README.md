# Capifaction

Some common Capistrano recipies for Webfaction.

## Installation

Add this line to your application's Gemfile:

    gem 'capifaction'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capifaction

## Usage

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

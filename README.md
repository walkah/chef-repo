This is my working chef-repo - used primarily with [vagrant](http://vagrantup.com/). Right now it's focused on [drupal](http://drupal.org/) development.

## Requirements 

* Working ruby + ruby gems installation (tested with 1.9.2+)
* bundler (`gem install bundler`)

## Installation

* From the repository clone, run `bundle install`
* Run `librarian-chef install` to grab the cookbooks

### For Vagrant

* Edit the Vagrantfile for your preferred box, role (see `roles`) and hosts.
* Run `vagrant up`
* Go get a coffee

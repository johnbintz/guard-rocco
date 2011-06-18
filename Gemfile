source "http://rubygems.org"

# Specify your gem's dependencies in guard-rocco.gemspec
gemspec

require 'rbconfig'
gem 'guard'
gem 'guard-rspec'

if RbConfig::CONFIG['host_os'] =~ /darwin/
  gem 'growl'
  gem 'rb-fsevent'
end

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "mongoid_money"
  gem.homepage = "http://github.com/jeffbozek/mongoid_money"
  gem.license = "MIT"
  gem.summary = %Q{Money datatype for Mongoid. Inspired by Ruby Money.}
  gem.description = %Q{Money datatype for Mongoid. Inspired by Ruby Money. Makes handling money simple. Stores the value in the db as cents. Currently handles USD.}
  gem.email = "jeff.bozek@gmail.com"
  gem.authors = ["Jeff Bozek"]
  gem.files = Dir.glob('lib/**/*.rb')
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  gem.add_runtime_dependency 'mongo', '~> 1.1'
  gem.add_runtime_dependency 'mongoid', '~> 2.0.2'
end
Jeweler::RubygemsDotOrgTasks.new

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new
rescue LoadError
  task(:spec){abort "`gem install rspec` to run specs"}
end
task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "mongoid_money #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

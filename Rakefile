# encoding: utf-8

require 'rubygems'
require 'rake'
require 'bundler'
Bundler::GemHelper.install_tasks

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "mongoid_money"
  gem.homepage = "http://github.com/jeffbozek/mongoid_money"
  gem.license = "MIT"
  gem.summary = %Q{Money datatype for Mongoid. Inspired by Ruby Money.}
  gem.description = %Q{Money datatype for Mongoid. Inspired by Ruby Money. Makes handling money simple. Stores the value in the db as cents. Currently handles USD.}
  gem.email = "jeff.bozek@gmail.com"
  gem.authors = ["Jeff Bozek", "Peter Savichev (proton)"]
  gem.files = Dir.glob('lib/**/*.rb')
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
end

task :default => :spec

require 'rdoc/task'
RDoc::Task.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "mongoid_rateable #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
require 'mongoid'
require 'database_cleaner'
require 'mongoid_money'
require 'rubygems'
require "simplecov"

Dir["./spec/support/**/*.rb"].each {|f| require f}

SimpleCov.start

Mongoid.config.master = Mongo::Connection.new.db("monogid_money_test")
Mongoid.logger = Logger.new($stdout)

DatabaseCleaner.orm = "mongoid"

RSpec.configure do |config|
  config.before(:all) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.mock_with :rspec
end
require 'mongoid'
require 'database_cleaner'
require 'mongoid_money'
require 'rubygems'

Dir["./spec/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  
  Mongoid.configure do |mconfig|
    name = "monogid_money_test"
    host = "localhost"
    port = 27017
    mconfig.database = Mongo::Connection.new.db(name)
  end
  
  DatabaseCleaner.strategy = :truncation
  
  config.before(:each) do
    DatabaseCleaner.clean
  end

  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

end
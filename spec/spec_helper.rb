$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'

require 'logger'
require 'active_record'
require 'active_support'
require 'sqlite3'
require 'globalize3'

require 'enum_records'

#load models schema (create tables)
require "db/schema_loader"

#load models
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'models'))
Dir["#{File.dirname(__FILE__)}/models/**/*.rb"].each {|f| require f}

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  
end

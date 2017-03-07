ENV['RACK_ENV'] = 'test'
require("rspec")
  require("pg")
  require("sinatra/activerecord")
  require("driver")
  require("passenger")

RSpec.configure do |config|
  config.after(:each) do
    Passenger.all().each()  do |passenger|
      task.destroy()
    end
  end
end

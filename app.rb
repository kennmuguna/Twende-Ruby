require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/passenger")
require("./lib/driver")
require("pg")

get('/') do
  erb(:index)
end

get('/FAQ') do
  erb(:FAQ)
end

get('/about') do
  erb(:about)
end

get("/driver_signin") do
  erb(:driver_form)
end

get("/passenger_signin")  do
  erb(:passenger_form)
end

get("/driver")  do
  erb(:driver)
end

get("/passenger")  do
  erb(:passenger)
end

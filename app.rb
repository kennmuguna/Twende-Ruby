require("sinatra")
require("sinatra/activerecord")
require("sinatra/reloader")
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

get ("/driver") do
  @drivers = Driver.all()
  erb(:driver)
end

get("/driver_signin") do
  erb(:driver_form)
end

post("/driver")  do
  name = params.fetch("name").capitalize!()
  email = params.fetch("email")
  phone_number = params.fetch("phone_number").to_i()
  car = params.fetch("car").capitalize!()
  number_plate = params.fetch("number_plate")
  space = params.fetch("space").to_i()
  route_from = params.fetch("route_from").capitalize!()
  route_to = params.fetch("route_to").capitalize!()
  time = params.fetch("time")
  driver = Driver.new({:name => name, :email => email, :phone_number => phone_number, :car => car, :number_plate => number_plate, :space => space, :route_from => route_from, :route_to => route_to, :time => time, :id => nil})
  driver.save()
  erb(:driver)
end

get('/routes') do
  erb(:routes)
end

get("/passenger")  do
  erb(:passenger)
end

get("/passenger_signin")  do
  erb(:passenger_form)
end

get('/terms_and_conditions') do
  erb(:terms_and_conditions)
end

get('/payment') do
  erb(:payment)
end

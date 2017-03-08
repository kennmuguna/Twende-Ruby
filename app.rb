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

get("/passenger_signin/:id")  do
  @driver = Driver.find(params.fetch("id").to_i())
  erb(:passenger_form)
end

get ("/driver") do
  @driver
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
  route_from = params.fetch("route_from")
  route_to = params.fetch("route_to")
  time = params.fetch("time")
  @driver = Driver.new({:name => name, :email => email, :phone_number => phone_number, :car => car, :number_plate => number_plate, :space => space, :route_from => route_from, :route_to => route_to, :time => time, :id => nil})
  if @driver.save()
    erb(:driver)
  else
    erb(:errors1)
  end
end

post("/passenger")  do
  name = params.fetch("name").capitalize!()
  email = params.fetch("email")
  phone_number =  params.fetch("phone_number").to_i()
  driver_id = params.fetch("driver_id").to_i()
  @driver = Driver.find(driver_id)
  @passenger = Passenger.new({:name => name, :email => email, :phone_number => phone_number, :driver_id => driver_id})
  if @passenger.save()
    erb(:passenger)
  else
    erb(:errors)
  end
end

get("/passenger")  do
  @passenger
  erb(:passenger)
end

get("/routes") do
  @drivers = Driver.all()
  erb(:routes)

get("/passenger_signin")  do
  erb(:passenger_form)
end

get('/terms_and_conditions') do
  erb(:terms_and_conditions)
end

get('/payment') do
  erb(:payment)
end

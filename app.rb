require("sinatra")
require("sinatra/activerecord")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/passenger")
require("./lib/driver")
require("pg")

enable :sessions
helper do
  def validate(name,email,password)
    
  end
end

get('/') do
  erb(:index)
end

get('/FAQ') do
  erb(:FAQ)
end

get('/about') do
  erb(:about)
end


get('/terms_and_conditions') do
  erb(:terms_and_conditions)
end

get("/payment") do
  erb(:payment)
end

# driver backend
get("/driver_signin") do
  erb(:driver_form)
end

post("/driver")  do
  name = params.fetch("name").capitalize!()
  email = params.fetch("email")
  password = params.fetch("password")
  phone_number = params.fetch("phone_number").to_i()
  car = params.fetch("car").capitalize!()
  image = params.fetch("image")
  number_plate = params.fetch("number_plate")
  space = params.fetch("space").to_i()
  route_from = params.fetch("route_from")
  route_to = params.fetch("route_to")
  time = params.fetch("time")
  @driver = Driver.new({:name => name, :email => email, :password => password, :phone_number => phone_number, :car => car, :image => image, :number_plate => number_plate, :space => space, :route_from => route_from, :route_to => route_to, :time => time, :id => nil})
  if @driver.save()
    erb(:driver)
  else
    erb(:errors1)
  end
end

get ("/driver") do
  @driver
  erb(:driver)
end

get("/driver_login") do
  name = params.fetch("name").capitalize!()
  email = params.fetch("email")
  password = params.fetch("password")
  @driver = Driver.find(name)
  @driver = Driver.find(email)
  @driver = Driver.find(password)
  @driver = Driver.find(params.fetch("id").to_i())
  erb(:"users/driver_home")
end

# display routes
get("/routes") do
  @drivers = Driver.all()
  erb(:routes)
end

# passenger backend
get("/passenger_signin/:id")  do
  @driver = Driver.find(params.fetch("id").to_i())
  erb(:passenger_form)
end

get("/routes") do
  @drivers = Driver.all()
  erb(:routes)
end

get("/passenger_signin")  do
  erb(:passenger_form)
end

post("/passenger")  do
  name = params.fetch("name").capitalize!()
  email = params.fetch("email")
  password = params.fetch("password")
  phone_number =  params.fetch("phone_number").to_i()
  driver_id = params.fetch("driver_id").to_i()
  @driver = Driver.find(driver_id)
  @passenger = Passenger.new({:name => name, :email => email, :password => password, :phone_number => phone_number, :driver_id => driver_id})
  puts params
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

get("/passenger_login") do
  erb(:passenger_login)
end

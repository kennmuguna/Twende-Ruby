require("sinatra")
require("sinatra/reloader")

get('/') do
  erb(:index)
end

get('/about') do
  erb(:about)
end

get('/routes') do
  erb(:routes)
end

get('/payment') do
  erb(:payment)
end

get('/FAQ') do
  erb(:FAQ)
end

get('/terms_and_conditions') do
  erb(:terms_and_conditions)
end

get('/driver') do
  erb(:driver)
end

get('/driver/new') do
  erb(:driver_form)
end

get('/passenger') do
  erb(:passenger)
end

get('/passengers/new') do
  erb(:passenger_form)
end

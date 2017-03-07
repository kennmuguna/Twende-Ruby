require("sinatra")
require("sinatra/reloader")

get('/') do
  erb(:index)
end

get('/FAQ') do
  erb(:FAQ)
end

get('/about') do
  erb(:about)
end

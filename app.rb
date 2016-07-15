require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  erb(:index)
end

get('/owner') do
  erb(:owner)
end

get('/owner/clients') do
  erb(:clients)
end

get('/owner/clients/new') do
  erb(:client_form)
end

get('/owner/stylists') do
  erb(:stylists)
end

get('/owner/stylists/new') do
  erb(:stylists_form)
end

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
  @clients = Client.all()
  erb(:clients)
end

get('/owner/clients/new') do
    @stylists = Stylist.all()
  erb(:client_form)
end

get('/owner/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

get('/owner/stylists/new') do
  erb(:stylists_form)
end

post('/owner/stylists/new') do
  stylist_name = params.fetch("stylist_name")
  stylist = Stylist.new({:name => stylist_name})
  stylist.save()
  @stylists = Stylist.all()
  erb(:stylists)
end

post('/owner/clients/new') do
  client_name = params.fetch("client_name")
  stylist_id = params.fetch("stylist_id").to_i()
  client = Client.new({:name => client_name, :stylist_id => stylist_id})
  client.save()
  @clients = Client.all()
  erb(:clients)
end

get('/owner/clients/client/:id') do
  @id = params.fetch('id').to_i()
  @client = Client.find(@id)
  @stylists = Stylist.all()
  erb(:client_edit)
end

get('/owner/stylists/stylist/:id') do
  @id = params.fetch('id').to_i()
  @stylist = Stylist.find(@id)
  erb(:stylist_edit)
end

patch('/owner/stylists/stylist/:id') do
  @id = params.fetch('id').to_i()
  @name = params.fetch('stylist_name')
  @stylist = Stylist.find(@id)
  @stylist.update({:name => @name})
  @stylists = Stylist.all()
  erb(:stylists)
end

delete('/owner/stylists/stylist/:id') do
  @id = params.fetch('id').to_i()
  Stylist.delete(@id)
  @stylists = Stylist.all()
  erb(:stylists)
end

patch('/owner/clients/client/:id') do
  id = params.fetch('id').to_i()
  name = params.fetch('client_name')
  stylist_id = params.fetch('stylist_id').to_i()
  updated_client = Client.find(id)
  updated_client.update({:name => name, :stylist_id => stylist_id})
  @clients = Client.all()
  erb(:clients)
end

delete('/owner/clients/client/:id') do
  id = params.fetch('id').to_i()
  Client.delete(id)
  @clients = Client.all()
  erb(:clients)
end

require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @stylists = Stylist.all
  erb(:index)
end

post '/' do
  stylist = Stylist.create({style_name: params.fetch('style_name'), avail_mon: nil, avail_tue: nil, avail_wed:nil, avail_thu: nil, avail_fri: nil, avail_sat: nil, avail_sun: nil})
  redirect '/'
end

delete '/:id' do
  id = params.fetch('id').to_i
  stylist = Stylist.find(id)
  stylist.delete
  redirect '/'
end

get '/stylist/:style_name/:id' do
  style_id = params.fetch('id').to_i
  @stylist = Stylist.find(style_id)
  @clients = @stylist.clients
  erb(:stylist)
end

post '/stylist/:style_name/:id' do
  style_id = params.fetch('id').to_i
  @stylist = Stylist.find(style_id)
  client_name = params.fetch('client')
  Client.create(client_name: client_name, stylist_id: @stylist.id)
  @clients = @stylist.clients
  erb(:stylist)
end

delete '/stylist/:style_name/:id' do
  s_id = params.fetch('id')
  s_name = params.fetch('style_name')
  s_url = s_name + '/' + s_id
  client_id = params.fetch('client_id').to_i
  client = Client.find(client_id)
  client.delete
  redirect ('/stylist/'.concat(s_url))
end

get '/clients' do
  @clients = Client.all
  erb(:client)
end

delete '/clients/delete' do
  del_client = params.fetch('client_id').to_i
  del_client = Client.find(del_client)
  del_client.delete
  redirect '/clients'
end

require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @stylists = Stylist.all
  erb(:index)
end

post '/' do
  Stylist.create({style_name: params.fetch('style_name')})
  redirect '/'
end

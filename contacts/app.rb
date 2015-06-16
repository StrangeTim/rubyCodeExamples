require("sinatra")
require("sinatra/reloader")
require('./lib/address')
require('./lib/contact')
require('./lib/email')
require('./lib/phone')
also_reload("lib/**/*.rb")

@all_contacts = {}
@all_contact_keys = []

get('/') do
  # @all_contacts = Contact.all()
  # @all_contact_keys = @all_contacts.keys
  erb(:index)
end

get('/next') do
  @selection = params.fetch('options')
  if @selection == 1
    erb(:add_contact)
  elsif @selection == 2
    erb(:contact)
  else
    erb(:all_contacts)
  end
end

get('/add_contact') do
  erb(:add_contact)
end

get('/success') do
  erb(:sucess)
end

get('/contact') do
  erb(:contact)
end

get('/all') do
  erb(:all)
end

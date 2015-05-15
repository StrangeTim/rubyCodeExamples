require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  erb(:index)
end

get '/bands' do
  @bands = Band.all
  @venues = nil
  erb(:bands)
end

post '/bands' do
  all_bands = Band.all
  matches = false
  all_bands.each() do |band|
    if band.band_name == params.fetch('band_name')
      matches = true
    end
  end
  if !matches
    Band.create({band_name: params.fetch('band_name')})
  end
  redirect '/bands'
end

delete '/bands' do
  delete_id = params.fetch('delete_band').to_i
  delete_band = Band.find(delete_id)
  delete_band_venues = delete_band.venues
  delete_band_venues.each do |venue|
    venue.bands.destroy(delete_band)
  end
  delete_band.delete
  redirect '/bands'
end

get '/bands/:id' do
  @id = params.fetch('id').to_i
  @this_band = Band.find(@id)
  @venues = @this_band.venues
  @all_venues = Venue.all
  erb(:bands)
end

patch '/bands/:id' do
  band_id = params.fetch('id').to_i
  add_venue = Venue.find(params.fetch('venue_add'))
  this_band = Band.find(band_id)
  bands_venues = this_band.venues
  matches = false
  bands_venues.each() do |venue|  #prevents associating a band twice
    if venue == add_venue
      matches = true
    end
  end
  if !matches
    this_band.venues.push(add_venue)
  end
  redirect ('/bands/'.concat(band_id.to_s))
end

delete '/bands/:id' do
  band_id = params.fetch('id')
  this_band = Band.find(band_id.to_i)
  delete_venue = params.fetch('delete_venue').to_i
  this_band.venues.destroy(delete_venue)
  redirect ('/bands/'.concat(band_id))
end


get '/venues' do
  @venues = Venue.all
  @bands = nil
  erb(:venues)
end

post '/venues' do
  all_venues = Venue.all
  matches = false
  all_venues.each() do |venue|
    if venue.venue_name == params.fetch('venue_name')
      matches = true
    end
  end
  if !matches
    Venue.create({venue_name: params.fetch('venue_name')})
  end
  redirect '/venues'
end

delete '/venues' do
  delete_id = params.fetch('delete_venue').to_i
  delete_venue = Venue.find(delete_id)
  delete_venue_bands = delete_venue.bands
  delete_venue_bands.each do |band|
    band.venues.destroy(delete_venue)
  end
  delete_venue.delete
  redirect '/venues'
end


get '/venues/:id' do
  @id = params.fetch('id').to_i
  @this_venue = Venue.find(@id)
  @bands = @this_venue.bands
  @all_bands = Band.all
  erb(:venues)
end

patch '/venues/:id' do
  venue_id = params.fetch('id').to_i
  add_band = Band.find(params.fetch('band_add'))
  this_venue = Venue.find(venue_id)
  venue_bands = this_venue.bands
  matches = false
  venue_bands.each() do |band|  #prevents associating a band twice
    if band == add_band
      matches = true
    end
  end
  if !matches
    this_venue.bands.push(add_band)
  end
  redirect ('/venues/'.concat(venue_id.to_s))
end

delete '/venues/:id' do
  venue_id = params.fetch('id')
  this_venue = Venue.find(venue_id.to_i)
  delete_band = params.fetch('delete_band').to_i
  this_venue.bands.destroy(delete_band)
  redirect ('/venues/'.concat(venue_id))
end

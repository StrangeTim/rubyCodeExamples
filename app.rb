require('sinatra')
require('sinatra/reloader')
require('./lib/scrabble_score')

get('/') do
  erb(:index)
end

get('/scrabble_score') do
  @word = params.fetch('scrabble_word').scrabble
  erb(:scrabble_score)
end

require('sinatra')
require('sinatra/reloader')
require('./lib/friday_review')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/display_page') do
  @find_word = params.fetch('find_word')
  @test_phrase = params.fetch('test_phrase')
  @word_count = @find_word.friday_review(@test_phrase)
end

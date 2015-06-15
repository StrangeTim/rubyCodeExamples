require('sinatra')
require('sinatra/reloader')
require('./lib/anagrams')
also_reload('lib/**/*.rb')

get ('/') do
  erb(:index)
end

get('/anagrams') do
  @primary_word = params.fetch('primary_word')
  test_words = params.fetch('test_words')
  @result = (@primary_word).anagrams(test_words.split(", "))
  @result = @result.join(", ")
  erb(:anagrams)
end

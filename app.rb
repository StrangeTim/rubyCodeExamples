require 'sinatra'
require 'sinatra/reloader'
require './lib/word'
require './lib/definition'
also_reload("lib/**/*.rb")


@all_words = []
@word = " "


get('/') do
  @all_words = Word.key_sort
  erb(:index)
end

get('/success') do
  @word = params.fetch('word').downcase
  @message = ""
  @choice = params.fetch('drop_choice')
  if @choice == "1"
    @message = "added"
    word_to_add = Word.new(@word)
    word_to_add.add_word
    erb(:success)
  elsif @choice == "2"
    @message = "deleted"
    erb(:success)
  elsif @choice == "3"
    @all_words = Word.all_words.to_a
    erb(:display)
  end
end

get('/display') do
  word_link = params.fetch('link_word')
  @all_words = [word_link, Word.all_words.fetch(word_link)]
  erb(:display)
end

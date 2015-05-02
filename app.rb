require 'sinatra'
require 'sinatra/reloader'
require './lib/word'
require './lib/definition'
also_reload("lib/**/*.rb")

@all_words = {}
@dictionary = {}
@word = " "


get('/') do
  @dictionary = Word.dictionary
  @all_words = Word.all_words
  @words_only = @dictionary.keys
  erb(:index)
end

get('/success') do
  @word = params.fetch('word').downcase
  @message = ""
  @choice = params.fetch('drop_choice')
  if @choice == "1"
    @message = "Your word, " + @word + ", has been added"
    word_to_add = Word.new(@word)
    word_to_add.dictionary_add
    word_to_add.list_add
    erb(:success)
  elsif @choice == "2"
    @message = "The delete function is still under construction."
    erb(:success)
  elsif @choice == "3"
    @all_words = Word.dictionary.to_a
    erb(:display)
  end
end

get('/display/:id') do
  @all_words = Word.all_words
  @dictionary = Word.dictionary
  @words_only = @dictionary.keys
  @word1 = @all_words.fetch(0)
  @display_word = @all_words.fetch(params.fetch('id').to_i)
  @display_word2 = @dictionary
  @display_word3 = @words_only
  erb(:display)
end

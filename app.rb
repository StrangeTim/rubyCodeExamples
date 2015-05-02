require 'sinatra'
require 'sinatra/reloader'
require './lib/word'
require './lib/definition'
also_reload("lib/**/*.rb")

@all_words = {}
@dictionary = {}
@word = " "
@current_word = nil


get('/') do
  @dictionary = Word.dictionary
  @all_words = Word.all_words
  @words_only = @dictionary.keys
  erb(:index)
end

post('/') do

  @word = params.fetch('word').downcase
  @message = ""
  @choice = params.fetch('drop_choice')
  if @choice == "1"
    @message = "Your word, " + @word + ", has been added"
    word_to_add = Word.new(@word)
    word_to_add.dictionary_add
    word_to_add.list_add
  elsif @choice == "2"
    @message = "The delete function is still under construction."
  elsif @choice == "3"
    @current_word = Word.all_words
    erb(:display)
  end
  @dictionary = Word.dictionary
  @all_words = Word.all_words
  @words_only = @dictionary.keys
  erb(:index)
end

get('/display/:id') do
  @dictionary = Word.dictionary
  @all_words = Word.all_words
  @words_only = @dictionary.keys

  @current_word = @all_words.fetch(params.fetch('id').to_i)
  erb(:display)
end

post('/display/:id') do
  @dictionary = Word.dictionary
  @all_words = Word.all_words
  @words_only = @dictionary.keys

  @definition = params.fetch('definition')
  new_def = Definition.new(@definition)
  @current_word = @all_words.fetch(params.fetch('id').to_i)
  @current_word.add_def(new_def)
  erb(:display)
end

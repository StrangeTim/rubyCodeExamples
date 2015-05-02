require 'capybara/rspec'
require './app'
require './lib/word'
Capybara.app = Sinatra::Application

describe("The word add path", {:type => :feature}) do
  it('Tests adding a word to the class hash and display') do
    visit('/')
    select("Add a word", :from => 'drop_choice')
    fill_in('word', :with => 'Superfluous')
    click_button('Next')
    expect(page).to have_content('Your word, superfluous, has been added')
    expect(Word.dictionary).to(eq({"superfluous" => nil}))
  end
end

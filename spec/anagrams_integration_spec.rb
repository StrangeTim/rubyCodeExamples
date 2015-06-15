require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Anagram to word testing', {:type => :feature}) do
  it ('Receives primary word and test words, separates anagrams') do
    visit('/')
    fill_in('primary_word', :with => 'god')
    fill_in('test_words', :with => "dgo, fox, vrab, gdo, dog")
    click_button("Submit")
    expect(page).to have_content('dgo, gdo, dog')
  end
end

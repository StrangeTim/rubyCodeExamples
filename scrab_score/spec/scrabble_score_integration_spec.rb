require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application

describe('The scrabble score page', {:type => :feature}) do
  it('shows the correct score for a given word') do
    visit('/')
    fill_in('scrabble_word', :with => 'bananas')
    click_button('Send')
    expect(page).to have_content('Your score is 9')
  end
end

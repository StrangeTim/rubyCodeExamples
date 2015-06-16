require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application

describe("The word frequency app", {:type => :feature}) do
  it('Tests basic spec run through sinatra. 1 word in both primary and secondary fields') do
    visit('/')
    fill_in('find_word', :with => 'happy')
    fill_in('test_phrase', :with => 'happy')
    click_button('Count')
    expect(page).to have_content('1 time')
  end
end

ENV['RACK_ENV'] = 'test'
require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the add a stylist path", {:type => :feature}) do
  it("Adds a new stylist to the hair salon.") do
    visit('/')
    fill_in('style_name', with: 'Pierre')
    click_button('Add')
    expect(page).to have_content('Pierre')
  end
end

require 'capybara/rspec'
require  './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Package volume and cost calculation spec program paths.', {:type => :feature}) do
  it ('Inputs package parameters and calculates cost, displayed correctly') do
    visit('/')
    fill_in('length', :with => 3)
    fill_in('width', :with => 5)
    fill_in('height', :with => 5)
    fill_in('weight', :with => 10)
    fill_in('distance', :with => 250)
    click_button("Submit")
    expect(page).to have_content("$21.00")
  end
end

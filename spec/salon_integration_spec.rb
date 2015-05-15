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

describe("the indvidual stylist path", {:type => :feature}) do
  it("navigates to a stylists personal page.") do
    visit('/')
    fill_in('style_name', with: 'Pierre')
    click_button('Add')
    fill_in('style_name', with: 'Molly')
    click_button('Add')
    fill_in('style_name', with: 'Kelly')
    click_button('Add')

    click_link('Molly')
    expect(page).to have_content('Molly')
    expect(page).to have_content('Monday')
  end
end

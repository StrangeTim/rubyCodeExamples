require('capybara/rspec')
require('./app')
Capybara.app = Sinatra:: Application
set(:show_exceptions, false)

describe('The result path', {:type => :feature}) do
  it ('Receives three numbers and tells you whether they can form a triangle and which kind of triangle they are') do
    visit('/')
    fill_in('side_1', :with=> 2)
    fill_in('side_2', :with => 2)
    fill_in('side_3', :with => 2)
    click_button("Submit")
    expect(page).to have_content("Your triangle is equilateral")
  end
end

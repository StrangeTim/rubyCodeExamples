require 'capybara/rspec'
require './app'
require './lib/books'
require 'spec_helper'
Capybara.app = Sinatra::Application

describe("The library books display path", {:type => :feature}) do

  it("Displays all books currently in the database") do
    visit('/books')
    expect(page).to have_content('The Catcher in the Rye')

  end
end

describe("The library authors display path", {:type => :feature}) do

  it("Displays all authors currently in the database") do
    visit('/authors')
    expect(page).to have_content("William Shakefist")

  end
end

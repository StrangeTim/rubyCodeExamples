ENV['RACK_ENV'] = 'test'
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

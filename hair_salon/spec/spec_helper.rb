ENV['RACK_ENV'] = 'test'


require("bundler/setup")
Bundler.require(:default, :test)

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.after(:each) do
    Stylist.all.each do |i|
      i.destroy
    end
    Client.all.each do |a|
      a.destroy
    end
  end
end

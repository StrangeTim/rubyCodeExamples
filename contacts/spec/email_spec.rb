require 'rspec'
require 'contact'
require 'email'
require 'pry'

describe(Email) do

  before() do
    Email.clear()
  end

  describe('#email_address') do
    it("creates an emails class variable which stores emails depending on type") do
      test_email = Email.new("bobsaget@afhm.com")
      expect(test_email.work_emails()).to(eq("work1" => "bobsaget@afhm.com"))
    end
  end

  describe('#email_address2') do
    it("creates an additional email and stores i properly to all_emails") do
      test_email = Email.new("bobsaget@afhm.com")
      test_email.add_emails()
      test_email.new_email("work","bobs@gmail.com")
      test_email.new_email("home","bobbys@gmail.com")
      test_email.new_email("school","robert@gmail.com")
      expect(Email.all()).to(eq("work_emails" => {"work1" => "bobsaget@afhm.com", "work2" => "bobs@gmail.com"}, "home_emails" => {"home1" => "bobbys@gmail.com"}, "school_emails" => {"school1" => "robert@gmail.com"}))
    end
  end
end

require 'pry'

class Email
  @@all_emails = {}

  define_method(:initialize) do |email|
    @work_emails = {"work1" => email}
    @home_emails = {}
    @school_emails = {}
    @work_e_count = 1
    @home_e_count = 0
    @school_e_count = 0
  end

  define_singleton_method(:clear) do
    @@all_emails = {}
  end

  define_singleton_method(:all) do
    @@all_emails
  end

  define_method(:add_emails) do
    @@all_emails.store("work_emails", self.work_emails())
    @@all_emails.store("home_emails", self.home_emails())
    @@all_emails.store("school_emails", self.school_emails())
  end

  attr_reader(:work_emails, :home_emails, :school_emails)

  define_method(:new_email) do |type, address|

    if type == "work"
      type += (@work_e_count + 1).to_s
      @work_e_count += 1
      @work_emails.store(type, address)
    end

    if type == "home"
      type += (@home_e_count + 1).to_s
      @home_e_count += 1
      @home_emails.store(type, address)
    end

    if type == "school"
      type += (@school_e_count + 1).to_s
      @school_e_count += 1
      @school_emails.store(type, address)
    end
    self.add_emails()
  end

end

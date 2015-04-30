require 'pry'

class Contact
  @@contact_list = {}

  # contact_info = {f_name => {}, l_name => {}, b_d => {}, phone => {}, email => {}, addresses => {}}

  define_method(:initialize) do |contact_info|
    @first_name = contact_info.fetch(:first_name)
    @last_name = contact_info.fetch(:last_name)
    @birth_date = contact_info.fetch(:birth_date)
# binding.pry
    @phone = {}
    @email = {}
    @addresses = {}
  end

  attr_reader(:first_name, :last_name, :birth_date)

  define_singleton_method(:clear) do
    @@contact_list = {}
  end

  define_method(:add_contact) do
    @@contact_list[(self.first_name() + " " + self.last_name())] = self
  end

  define_singleton_method(:all) do
    @@contact_list
  end

  define_method(:add_phone) do

  end

  define_method(:add_email) do

  end

  define_method(:add_address) do

  end

end

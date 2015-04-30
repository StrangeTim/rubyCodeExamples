require 'pry'

class Contact
  @@contact_list = {}    # {"F-N L-N" => contact_info(down_below)}

  # contact_info = {f_name => asfd, l_name => asdfa, b_d => 1324123
# phone => {{cell_numbers => {c1 => ####, etc.}, work_nums => {w1 => ####}, home....... etc},
# email => {{work_e =>{w1=>asdfa@adsf, w2=>adfs@adsf}, home_e=>{h1=>asdf@adf},school_e.....},
# addresses => {}}

  define_method(:initialize) do |contact_info|
    @first_name = contact_info.fetch(:first_name)
    @last_name = contact_info.fetch(:last_name)
    @birth_date = contact_info.fetch(:birth_date)
# binding.pry
    @phone = {}
    @email = {}
    @addresses = {}
  end

  attr_reader(:first_name, :last_name, :birth_date, :phone, :email, :addresses)

  define_singleton_method(:clear) do
    @@contact_list = {}
  end

  define_method(:add_contact) do
    @@contact_list[(self.first_name() + " " + self.last_name())] = self
  end

  define_method(:change_phone) do |new_phone|
    @phone = new_phone
  end

  define_method(:change_email) do |new_email|
    @email = new_email
  end

  define_method(:change_address) do |new_address|
    @addresses = new_address
  end

  define_singleton_method(:all) do
    @@contact_list
  end

  define_method(:add_phone) do |phone| # add a list of phone numbers (phone class) to an existing contact
    stored_contact = (Contact.all()).fetch((self.first_name() + " " + self.last_name())) #grab all existing contact info
    stored_contact.change_phone(phone)
    stored_contact.add_contact()   # same f-n l-n as this_guy1 = same key for @@contact_list so therefore replaces this_guy1
  end

  define_method(:add_email) do |e_address|
    stored_contact = (Contact.all()).fetch((self.first_name() + " " + self.last_name()))
    stored_contact.change_email(e_address)
    stored_contact.add_contact()
  end

  define_method(:add_address) do |address|
    stored_contact = (Contact.all()).fetch((self.first_name() + " " + self.last_name()))
    stored_contact.change_address(address)
    stored_contact.add_contact()
  end

end

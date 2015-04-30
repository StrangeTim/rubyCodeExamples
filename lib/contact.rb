class Contact
  @@contact_list = []

  define_method(:initialize) do |contact_info|
    @first_name = contact_info.fetch(:first_name)
    @last_name = contact_info.fetch(:last_name)
    @birth_date = contact_info.fetch(:birth_date)
  end

  attr_reader(:first_name, :last_name, :birth_date)

end

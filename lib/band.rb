class Band < ActiveRecord::Base
  has_and_belongs_to_many :venues
  validates(:band_name, {:presence => true, :length => {:maximum => 50}})
  before_save(:capitalize_name)

  define_singleton_method(:all_names) do
    bands = Band.all
    just_names = []
    bands.each do |band|
      just_names.push(band.band_name)
    end
    just_names
  end


  private

  define_method(:capitalize_name) do
    name = self.band_name.split(" ")
    badwords = ["of", "the", "for", "and", "to", "a", "nor", "but", "an", "at", "by", "from", "in", "on", "up", "as", "it"]
    name.each do |word|
      if !badwords.include?(word)
        word.capitalize!
      end
    end
    if badwords.include?(name[0])
      name[0].capitalize!
    end
    name = name.join(" ")
    self.band_name = name
  end

end

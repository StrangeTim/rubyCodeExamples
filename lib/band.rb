class Band < ActiveRecord::Base
  has_and_belongs_to_many :venues
  validates(:band_name, {:presence => true, :length => {:maximum => 50}})
  before_save(:capitalize_name)


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
  end

end

class Venue < ActiveRecord::Base
  has_and_belongs_to_many :bands
  validates(:venue_name, {:presence => true, :length => {:maximum => 50}})
  before_save(:capitalize_name)

  define_singleton_method(:all_names) do
    venues = Venue.all
    just_names = []
    venues.each do |venue|
      just_names.push(venue.venue_name)
    end
    just_names
  end

  private

  define_method(:capitalize_name) do
    name = self.venue_name.split(" ")
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
    self.venue_name = name
  end



end

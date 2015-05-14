class Stylist < ActiveRecord::Base
  has_many :clients
  has_one :availability
end

class Availability < ActiveRecord::Base
  belongs_to :stylist, dependent: :destroy
end

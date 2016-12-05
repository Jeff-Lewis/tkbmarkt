class UserPosition < ActiveRecord::Base
belongs_to :user
reverse_geocoded_by :latitude, :longitude,
   :address => :geo_address
after_validation :reverse_geocode 
    
end

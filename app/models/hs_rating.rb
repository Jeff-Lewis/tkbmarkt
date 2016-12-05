class HsRating < ActiveRecord::Base
    belongs_to :user
    belongs_to :hotspot
    
    def self.avg_rating(hotspot)
        where("hotspot_id=?", hotspot).average(:user_rating) 
    end

end

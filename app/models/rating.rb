class Rating < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :service
    
    validates_inclusion_of :user_rating, :in => 1..5
    
end

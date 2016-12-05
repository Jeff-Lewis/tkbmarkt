class MobCategory < ActiveRecord::Base
    has_many :vehicles, dependent: :destroy 
end

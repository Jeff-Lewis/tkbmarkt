class Category < ActiveRecord::Base
    has_many :vehicles, dependent: :destroy 
    has_many :companies, dependent: :destroy 
    has_many :jobs, dependent: :destroy 
end

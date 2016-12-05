class Customer < ActiveRecord::Base
    has_many :accounts, dependent: :destroy 
    belongs_to :owner, polymorphic: true
end

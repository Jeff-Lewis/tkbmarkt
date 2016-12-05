class Ticket < ActiveRecord::Base
    has_many :user_tickets, dependent: :destroy 
    belongs_to :msponsor
    belongs_to :mcategory
end

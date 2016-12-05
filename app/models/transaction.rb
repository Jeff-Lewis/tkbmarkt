class Transaction < ActiveRecord::Base
    belongs_to :owner, polymorphic: true    
    validates :amount, :numericality => { :greater_than => 0}
end

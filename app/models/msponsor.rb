class Msponsor < ActiveRecord::Base
    belongs_to :mobject
    #belongs_to :user
    belongs_to :company
    has_many :tickets
end

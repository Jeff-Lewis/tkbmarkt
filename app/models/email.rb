class Email < ActiveRecord::Base
    
    validates :header, presence: true
    validates :body, presence: true
    
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :mobjects, as: :owner, dependent: :destroy 
    has_many :mstats, as: :owner, dependent: :destroy 
    has_many :customers, as: :owner, dependent: :destroy 
    has_many :transactions, as: :owner, dependent: :destroy 

    has_many :webmasters, dependent: :destroy 
    has_many :companies, dependent: :destroy 
    has_many :ratings, dependent: :destroy 
    has_many :mratings, dependent: :destroy 
    has_many :mcalendars, dependent: :destroy 
    #has_many :msponsors, dependent: :destroy 
    has_many :madvisors, dependent: :destroy
    has_many :favourits, dependent: :destroy 
    has_many :searches, dependent: :destroy
    has_many :user_tickets, dependent: :destroy 
    has_many :madvisors, dependent: :destroy 
    has_many :user_positions, dependent: :destroy 
    
    # validates :userid, presence: true, :uniqueness => true
    validates :lastname, presence: true    
    validates :name, presence: true
    
    before_validation :update_geo_address
    geocoded_by :geo_address
    after_validation :geocode

    has_attached_file :avatar, default_url: "/images/:style/missing.png", :styles => {:medium => "250x250#", :small => "50x50#" }
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    
    def self.search(filter, search)
        if filter
            @search = Search.find(filter)
            where(@search.build_sql)
        else
            if search
                where('anonymous=? and active=? and (name LIKE ? OR lastname LIKE ? OR email LIKE ?)', false, true, "%#{search}%","%#{search}%","%#{search}%")
            else
                where('anonymous=? and active=?',false, true)
            end
        end
    end

    def update_geo_address
      self.geo_address = self.address1 + " " + address2 + " " + address3
    end
    
    def fullname
        [name, lastname, email].join(' ')        
    end


    def build_stats(array_s, records, label)
      if records != nil
        anz = records.count
        if anz > 0
          array_s = array_s + "['" + label + "'," + anz.to_s + "],"
          return array_s
        end
      end
      return array_s
    end
end

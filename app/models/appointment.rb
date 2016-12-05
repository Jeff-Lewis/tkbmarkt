class Appointment < ActiveRecord::Base
  
    has_many :appointment_documents
    
    validate :valid_dates?
    validates_inclusion_of :time_from, :in => 1..24
    validates_inclusion_of :time_to, :in => 1..24

    def valid_dates?
      if app_date.is_a?(Date)
        if app_date >= Date.today
          if time_from >= time_to
            errors.add(:time_to, "invalid time")
          end
        else
          errors.add(:date_from, "date in past")
        end
      else
        errors.add(:date_from, "invalid date")
      end
    end

  def self.search(user_id1, cw, year)
    start_date = Date.commercial(year,cw,1)
    end_date = Date.commercial(year,cw,7)
    where('user_id1=? and active=? and app_date>=? and app_date<=?', user_id1, true, start_date, end_date)
  end 

end

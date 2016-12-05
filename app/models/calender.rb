class Calender < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :vehicle
    
    validate :valid_dates?
    validates_inclusion_of :time_from, :in => 1..24
    validates_inclusion_of :time_to, :in => 1..24
    
  def self.search(vehicle, cw, year)
    start_date = Date.commercial(year,cw,1)
    end_date = Date.commercial(year,cw,7)
    where('vehicle_id=? and active=? and ((date_from>=? and date_from<=?) or (date_to>=? and date_to<=?) or (date_from<=? and date_to>=?))', vehicle, true, start_date, end_date, start_date, end_date, start_date, end_date)
  end 

    def valid_dates?
      if date_from.to_date.is_a?(Date) and date_to.to_date.is_a?(Date)
        if date_from <= date_to
          if time_from < time_to
            return true
          end
        end
      end
      errors.add(:Date_from, "invalid date or time")
    end

end

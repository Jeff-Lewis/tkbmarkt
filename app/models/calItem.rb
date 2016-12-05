class CalItem

def initialize(calenders, start)
    @calhash = {}
    calenders.each do |c|
        for day in start..start+7
            for hour in c.vehicle.time_from..c.vehicle.time_to
                if day >= c.date_from.strftime("%d-%m-%y") and day <= c.date_to.strftime("%d-%m-%y") and hour >= c.date_from.strftime("%h") and hour <= c.date_to.strftime("%h")
                    @calhash << {:calender_id => c.id, :user => c.user_id, :datum => day, :zeit => hour}
                end
            end
        end
    end 
end

end
class Search < ActiveRecord::Base
    
    serialize :sql_string, Array
    
    validates :name, presence: true
    validate :valid_ages?
    validate :upper?

    belongs_to :user

    before_validation :update_geo_address
      
    geocoded_by :geo_address
    after_validation :geocode

    def update_geo_address
      self.geo_address = self.address1 + " " + address2 + " " + address3
    end

    def upper?
        self.keywords = self.keywords.upcase
        return true
    end

      def valid_ages?
        if age_from != nil and age_to != nil
            if age_from > 0 or age_to > 0
              if age_from < age_to
                return true
              end
            end
            if age_from == 0 and age_to == 0
                return true
            end
            errors.add(:age_from, "invalid age")
        end
      end

    def build_sql
        sql_string = []
        sql_string[0] ="active=?"
        sql_string << true
        case self.search_domain
        when "Privatpersonen", "Tickets"
            sql_string[0] = sql_string[0] + " and anonymous=?"
            sql_string << false
            if self.age_from != nil and self.age_from > 0
                end_date = Date.new(Date.today.year - age_from, Date.today.month, Date.today.day)
                sql_string[0] = sql_string[0] + " and dateofbirth <=?"
                sql_string << end_date.to_s
            end
            if self.age_to != nil and self.age_to > 0 and self.age_to < 100
                start_date = Date.new(Date.today.year - age_to, Date.today.month, Date.today.day)
                sql_string[0] = sql_string[0] + " and dateofbirth >=?"
                sql_string << start_date.to_s
            end
            if self.social
                sql_string[0] = sql_string[0] + " and id IN (?)"
                @services = Service.where('social=?', 't')
                sli = []
                @services.each do |s|
                    sli << s.user_id
                end
                sql_string << sli
            end
            if self.distance > 0 and self.longitude != nil and self.latitude != nil
                sql_string[0] = sql_string[0] + " and id IN (?)"
                @users = User.near(self.geo_address, self.distance)
                uli = []
                @users.each do |user|
                    uli << user.id
                end
                sql_string << uli
            end
            if self.search_domain == "Tickets"
                if self.customer
                    sql_string[0] = sql_string[0] + " and id IN (?)"
                    cid = Ticket.find(self.ticket_id).sponsor.company.id
                    @customers = Customer.where('company_id=?', cid)
                    cli = []
                    @customers.each do |c|
                        cli << c.user_id
                    end
                    sql_string << cli
                end
            end
            sql_string = find_keywords(sql_string, self.search_domain, self.keywords)
            self.counter = User.where(sql_string).count
            self.sql_string = sql_string

        when "Institutionen"
            if self.mcategory_id != "" and self.mcategory_id != nil and self.mcategory_id.to_s.length != 0
                sql_string[0] = sql_string[0] + " and mcategory_id=?"
                sql_string << self.mcategory_id
            end
            if self.social == true
                sql_string[0] = sql_string[0] + " and social=?"
                sql_string << true
            end
            if self.distance > 0 and self.longitude != nil and self.latitude != nil
                sql_string[0] = sql_string[0] + " and id IN (?)"
                @companies = Company.near(self.geo_address, self.distance)
                cli = []
                @companies.each do |company|
                    cli << company.id
                end
                sql_string << cli
            end
            sql_string = find_keywords(sql_string, self.search_domain, self.keywords)
            self.counter = Company.where(sql_string).count
            self.sql_string = sql_string

        when "Object"
            case self.mtype
                when "Angebote"
                    if self.social == true
                        sql_string[0] = sql_string[0] + " and social=?"
                        sql_string << true
                    end
                    if msubtype == "Aktion"
                        if self.date_from != nil and self.date_to != nil
                            sql_string[0] = sql_string[0] + " and ((date_from >=?"
                            sql_string << self.date_from
                            sql_string[0] = sql_string[0] + " and date_to <=?)"
                            sql_string << self.date_to
                            sql_string[0] = sql_string[0] + " or (date_from >=?"
                            sql_string << self.date_from
                            sql_string[0] = sql_string[0] + " and date_to <=?))"
                            sql_string << self.date_to
                        end
                    end

                when "Vermietungen"
                    if self.mcategory_id != "" and self.mcategory_id != nil and self.mcategory_id.to_s.length != 0
                        sql_string[0] = sql_string[0] + " and mcategory_id=?"
                        sql_string << self.mcategory_id
                    end

                when "Ausschreibungen"
                    if self.mcategory_id != "" and self.mcategory_id != nil and self.mcategory_id.to_s.length != 0
                        sql_string[0] = sql_string[0] + " and mcategory_id=?"
                        sql_string << self.mcategory_id
                    end
                    if self.date_from != nil and self.date_to != nil
                        sql_string[0] = sql_string[0] + " and ((date_from >=?"
                        sql_string << self.date_from
                        sql_string[0] = sql_string[0] + " and date_to <=?)"
                        sql_string << self.date_to
                        sql_string[0] = sql_string[0] + " or (date_from >=?"
                        sql_string << self.date_from
                        sql_string[0] = sql_string[0] + " and date_to <=?))"
                        sql_string << self.date_to
                    end

                when "Stellenanzeigen"
                    if self.mcategory_id != "" and self.mcategory_id != nil and self.mcategory_id.to_s.length != 0
                        sql_string[0] = sql_string[0] + " and mcategory_id=?"
                        sql_string << self.mcategory_id
                    end

                when "Veranstaltungen"
                    if self.mcategory_id != "" and self.mcategory_id != nil and self.mcategory_id.to_s.length != 0
                        sql_string[0] = sql_string[0] + " and mcategory_id=?"
                        sql_string << self.mcategory_id
                    end
                    if self.date_from != nil and self.date_to != nil
                        sql_string[0] = sql_string[0] + " and ((date_from >=?"
                        sql_string << self.date_from
                        sql_string[0] = sql_string[0] + " and date_to <=?)"
                        sql_string << self.date_to
                        sql_string[0] = sql_string[0] + " or (date_from >=?"
                        sql_string << self.date_from
                        sql_string[0] = sql_string[0] + " and date_to <=?))"
                        sql_string << self.date_to
                    end

                when "Ausflugsziele"
                    if self.mcategory_id != "" and self.mcategory_id != nil and self.mcategory_id.to_s.length != 0
                        sql_string[0] = sql_string[0] + " and mcategory_id=?"
                        sql_string << self.mcategory_id
                    end

                when "Kleinanzeigen"
                    if self.social == true
                        sql_string[0] = sql_string[0] + " and social=?"
                        sql_string << true
                    end
                    if self.mcategory_id != "" and self.mcategory_id != nil and self.mcategory_id.to_s.length != 0
                        sql_string[0] = sql_string[0] + " and mcategory_id=?"
                        sql_string << self.mcategory_id
                    end

                when "Crowdfunding"
                    if self.amount_from_target != nil and self.amount_from_target > 0 
                        sql_string[0] = sql_string[0] + " and amount >=?"
                        sql_string << self.amount_from_target
                    end
                    if self.amount_to_target != nil and self.amount_to_target > 0
                        sql_string[0] = sql_string[0] + " AND amount <=?"
                        sql_string << self.amount_to_target
                    end
                    if self.amount_from != nil and self.amount_from > 0
                        sql_string[0] = sql_string[0] + " and id IN (SELECT mobject_id FROM mstats GROUP BY mobject_id HAVING SUM(amount) >=?)"
                        sql_string << self.amount_from
                    end
                    if self.amount_to != nil and self.amount_to > 0
                        sql_string[0] = sql_string[0] + " and id IN (SELECT mobject_id FROM mstats GROUP BY mobject_id HAVING SUM(amount) <=?)"
                        sql_string << self.amount_to
                    end

            end
            sql_string[0] = sql_string[0] + " and mtype=?"
            sql_string << self.mtype
            if self.msubtype and self.msubtype != ""
                sql_string[0] = sql_string[0] + "and msubtype=?"
                sql_string << self.msubtype
            end
            if self.rating != nil and self.rating > 0
                sql_string[0] = sql_string[0] + " and id IN (select mobject_id from mratings WHERE rating >=?)"
                sql_string << self.rating
            end 
            if self.distance > 0 and self.longitude != nil and self.latitude != nil
                sql_string[0] = sql_string[0] + " and id IN (?)"
                @mobjects = Mobject.near(self.geo_address, self.distance)
                moli = []
                @mobjects.each do |mob|
                    moli << mob.id
                end
                sql_string << moli
            end
            sql_string = find_keywords(sql_string, self.search_domain, self.keywords)
            self.counter = Mobject.where(sql_string).count
            self.sql_string = sql_string
            
        end
    end
end

def find_keywords(sql_string, domain, keywords)
if keywords != nil and keywords != ""
    sql_string[0] = sql_string[0] + " and ("
    case domain
        when "Privatpersonen", "Tickets"
            sql_string[0] = sql_string[0] + like_token("lastname",keywords)
            keywords.split.each do |t| 
                sql_string << "%"+t+"%"
            end
            sql_string[0] = sql_string[0] + " OR "
            sql_string[0] = sql_string[0] + like_token("name",keywords)
            keywords.split.each do |t| 
                sql_string << "%"+t+"%"
            end
        when "Angebote", "Aktionen", "Mobilien", "Kleinanzeigen", "Sehenswuerdigkeiten", "Spendeninitiativen", "Rewardinitiativen", "Kreditinitiativen"
            sql_string[0] = sql_string[0] + like_token("name",keywords)
            keywords.split.each do |t| 
                sql_string << "%"+t+"%"
            end
            sql_string[0] = sql_string[0] + " OR "
            sql_string[0] = sql_string[0] + like_token("description",keywords)
            keywords.split.each do |t| 
                sql_string << "%"+t+"%"
            end
            sql_string[0] = sql_string[0] + " OR "
            sql_string[0] = sql_string[0] + like_token("stichworte",keywords)
            keywords.split.each do |t| 
                sql_string << "%"+t+"%"
            end
        when "Institutionen", "Stellenanzeigen"
            sql_string[0] = sql_string[0] + like_token("name",keywords)
            keywords.split.each do |t| 
                sql_string << "%"+t+"%"
            end
            sql_string[0] = sql_string[0] + " OR "
            sql_string[0] = sql_string[0] + like_token("stichworte",keywords)
            keywords.split.each do |t| 
                sql_string << "%"+t+"%"
            end
        else
            sql_string[0] = sql_string[0] + like_token("name",keywords)
            keywords.split.each do |t| 
                sql_string << "%"+t+"%"
            end
            sql_string[0] = sql_string[0] + " OR "
            sql_string[0] = sql_string[0] + like_token("description",keywords)
            keywords.split.each do |t| 
                sql_string << "%"+t+"%"
            end
    end
    sql_string[0] = sql_string[0] + ") "
end
return sql_string
end

def like_token(field, string)
    return_string = ""
    array = string.split
    if array.size > 0
        for i in 0..array.size-1
            return_string = return_string + "upper(" + field + ") LIKE ?"
            if i<array.size-1
                return_string = return_string + " OR "
            end
        end
    end
    return return_string
end
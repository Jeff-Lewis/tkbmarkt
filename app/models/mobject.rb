class Mobject < ActiveRecord::Base

belongs_to :owner, polymorphic: true
belongs_to :mcategory

has_many :mdetails
has_many :mratings
has_many :madvisors
has_many :mcalendars
has_many :mstats
has_many :msponsors

before_validation :update_geo_address
geocoded_by :geo_address
after_validation :geocode

def update_geo_address
  self.geo_address = self.address1.to_s + " " + address2.to_s + " " + address3.to_s
end


def self.search(cw, year, filter, mtype, msubtype, search)
if cw != nil and year != nil
      start_date = Date.commercial(year,cw,1)
      end_date = Date.commercial(year,cw,7)
      if msubtype
          if search
              where('name LIKE ? and mtype=? and msubtype=? and active=? and ((date_from >=? and date_from<=?) or (date_to>=? and date_to<=?) or (date_from<=? and date_to>=?))', "%#{search}%", mtype, msubtype, true, start_date, end_date, start_date, end_date, start_date, end_date)
          else     
              where('mtype=? and msubtype=? and active=? and ((date_from >=? and date_from<=?) or (date_to>=? and date_to<=?) or (date_from<=? and date_to>=?))', mtype, msubtype, true, start_date, end_date, start_date, end_date, start_date, end_date)
          end
      else
          if search
              where('name LIKE ? and mtype=? and active=? and ((date_from >=? and date_from<=?) or (date_to>=? and date_to<=?) or (date_from<=? and date_to>=?))', "%#{search}%", mtype, true, start_date, end_date, start_date, end_date, start_date, end_date)
          else
              where('mtype=? and active=? and ((date_from >=? and date_from<=?) or (date_to>=? and date_to<=?) or (date_from<=? and date_to>=?))', mtype, true, start_date, end_date, start_date, end_date, start_date, end_date)
          end
      end
    else
        if filter
            @search = Search.find(filter)
            where(@search.build_sql)
        else
            if search
                if msubtype
                    where('mtype=? and msubtype=? and active=? and name LIKE ?', mtype, msubtype, true, "%#{search}%")
                else
                    where('mtype=? and active=? and name LIKE ?', mtype, true, "%#{search}%")
                end
            else
                if msubtype
                    where('mtype=? and msubtype=? and active=?', mtype, msubtype, true)
                else
                    where('mtype=? and active=?', mtype, true)
                end
            end
        end
    end
end
end

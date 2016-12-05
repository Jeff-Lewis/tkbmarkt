class Webmaster < ActiveRecord::Base
    
    belongs_to :user
    
      def self.search(search)
          if search
                where('status <> ? and (user_comment LIKE ? OR web_user_comment LIKE ?)', "OK", "%#{search}%", "%#{search}%")
          else
                where('status <> ?',"OK")
          end
      end

end

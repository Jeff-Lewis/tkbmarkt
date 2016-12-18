class ShowcalController < ApplicationController

  def index
    if !session[:cw]
      session[:cw] = Date.today.cweek.to_i
    end
    if !session[:year]
      session[:year] = Date.today.year.to_i
    end
    if params[:dir]
      case params[:dir]
        when ">"
          if session[:cw] == 52
            session[:cw] = 1
            session[:year] = session[:year].to_i + 1
          else
            session[:cw] = session[:cw].to_i + 1
          end
        when "<"
          if session[:cw] == 1
            session[:cw] = 52
            session[:year] = session[:year].to_i - 1
          else
            session[:cw] = session[:cw].to_i - 1
          end
      end
    end
    @start = Date.commercial(session[:year],session[:cw],1)
    @mobjects = Mobject.search(session[:cw], session[:year], params[:filter_id], params[:mtype], params[:msubtype], params[:search]).order(created_at: :desc).page(params[:page]).per_page(10)
    
    #@mobjects = Mobject.all.page(params[:page])
    
    @mobanz = @mobjects.count
    @mtype = params[:mtype]
    @msubtype = params[:msubtype]

    session[:mtype] = params[:mtype]
    session[:msubtype] = params[:msubtype]

     counter = 0 
     @locs = "["
     @wins = "["
     @mobjects.each do |m|
       if m.latitude and m.longitude 
          @locs = @locs + "["
          if m.owner_type == "User"
            @locs = @locs + "'" + m.owner.fullname + "', "
          else
            @locs = @locs + "'" + m.owner.name + "', "
          end
          @locs = @locs + m.latitude.to_s + ", "
          @locs = @locs + m.longitude.to_s
          if counter+1 == @mobjects.count
            @locs = @locs + "]"
          else
            @locs = @locs + "],"
          end
    
          @wins = @wins + "["
          if m.mdetails.count > 0
            @wins = @wins + "'<img src=" + m.mdetails.first.avatar(:small) + "<br><h3>" + m.name + "</h3><p>" + m.geo_address + "<br>"+ m.date_from.strftime("%d.%m.%Y") + " - " + m.date_from.strftime("%d.%m.%Y") +"</p>'"
          else
            @wins = @wins + "'<img src=" + m.owner.avatar(:small) + "<br><h3>" + m.name + "</h3><p>" + m.geo_address + "<br>"+ m.date_from.strftime("%d.%m.%Y") + " - " + m.date_from.strftime("%d.%m.%Y") +"</p>'"
          end
          if counter+1 == @mobjects.count
            @wins = @wins + "]"
          else
            @wins = @wins + "],"
          end
          counter = counter + 1
        end
      end
      @locs = @locs + "]"
      @wins = @wins + "]"
    end

end

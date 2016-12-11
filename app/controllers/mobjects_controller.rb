class MobjectsController < ApplicationController
  before_action :set_mobject, only: [:show, :edit, :update, :destroy]

  # GET /mobjects
  def index
    @mobjects = Mobject.search(nil, nil, params[:filter_id], params[:mtype], params[:msubtype], params[:search]).order(created_at: :desc).page(params[:page]).per_page(10)
    @mobanz = @mobjects.count
    @mtype = params[:mtype]
    @msubtype = params[:msubtype]
    @param = params[:filter_id]
    @search = params[:search]
  end

  # GET /mobjects/1
  def show
    if !params[:topic]
      @topic = "Informationen"
    else
      @topic = params[:topic]
    end
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
    @calendars = Mcalendar.search(@mobject.id, session[:cw], session[:year]).order(date_from: :asc)
    @calanz = @calendars.count
    
    @mobjects_anz = Mstat.select("date(created_at) as datum, count(amount) as summe").where('mobject_id = ?', @mobject.id).group("date(created_at)")
    @mobjects_bet = Mstat.select("date(created_at) as datum, sum(amount) as summe").where('mobject_id = ?', @mobject.id).group("date(created_at)")

    @anz_s = ""
    @mobjects_anz.each do |i|
      @anz_s = @anz_s + "['" + i.datum.to_s + "', " + i.summe.to_s + "],"
    end
    @anz_s = @anz_s[0, @anz_s.length - 1]    

    @bet_s = ""
    @mobjects_bet.each do |i|
      @bet_s = @bet_s + "['" + i.datum.to_s + "', " + i.summe.to_s + "],"
    end
    @bet_s = @bet_s[0, @bet_s.length - 1]    
  end

  # GET /mobjects/new
  def new
    @mobject = Mobject.new
    @mobject.status = "new"
    @mobject.mtype = params[:mtype]
    @mobject.msubtype = params[:msubtype]
    @mobject.mcategory_id = params[:msubtype]
    @mobject.active = true
    @mobject.social = false
    @mobject.name = @mobject.mtype
    @mobject.description = "Beschreibung..."
    @mobject.homepage = "www.xyz.ch"
    @mobject.price_reg = 0
    @mobject.price_new = 0
    @mobject.date_from = Date.today
    @mobject.date_to = Date.today+30
    @mobject.time_from = 7
    @mobject.time_to = 18
    @mobject.amount = 10000.00
    @mobject.price = 100.00
    @mobject.reward = "Belohnung..."
    @mobject.interest_rate = 5
    @mobject.due_date = Date.today + 365

    if params[:user_id]
      @mobject.owner_id = params[:user_id]
      @mobject.owner_type = "User"
    end
    if params[:company_id]
      @mobject.owner_id = params[:company_id]
      @mobject.owner_type = "Company"
    end
    @mobject.address1 = @mobject.owner.address1
    @mobject.address2 = @mobject.owner.address2
    @mobject.address3 = @mobject.owner.address3
    @mobject.geo_address = @mobject.owner.geo_address
    @mobject.longitude = @mobject.owner.longitude
    @mobject.latitude = @mobject.owner.latitude

    case params[:mtype]
      when "Angebote"
        case params[:msubtype]
          when "Standard"
          when "Aktion"
        end
      when "Veranstaltungen"
      when "Ausscheibungen"
      when "Ausflugsziele"
      when "Crowdfunding"
        case params[:msubtype]
          when "Spenden"
          when "Belohnungen"
          when "Zinsen"
        end
      when "Kleinanzeigen"
      when "Stellenanzeigen"
      when "Vermietungen"
    end
  end

  # GET /mobjects/1/edit
  def edit
  end

  # POST /mobjects
  def create
    @mobject = Mobject.new(mobject_params)

    if @mobject.save
      redirect_to @mobject, notice: 'Mobject was successfully created.'
    else
      render :new
    end
  end

  # PUT /mobjects/1
  def update
    if @mobject.update(mobject_params)
      redirect_to @mobject, notice: 'Mobject was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mobjects/1
  def destroy
    @mobject.destroy
    redirect_to mobjects_url, notice: 'Mobject was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mobject
      @mobject = Mobject.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def mobject_params
      params.require(:mobject).permit(:owner_id, :owner_type, :mtype, :msubtype, :mcategory_id, :company_id, :user_id, :status, :name, :description, :reward, :interest_rate, :due_date, :date_from, :date_to, :time_from, :time_to, :days, :amount, :price, :tasks, :skills, :offers, :social, :price_reg, :price_new, :active, :keywords, :homepage, :address1, :address2, :address3, :latitude, :longitude, :geo_address)
    end

end

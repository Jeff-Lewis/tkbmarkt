class CalendersController < ApplicationController
  before_action :set_calender, only: [:show, :edit, :update, :destroy]
  permits :status, :vehicle_id, :user_id, :date_from, :date_to, :time_from, :time_to, :active

#  $wochentage = %w[Montag Dienstag Mittwoch Donnerstag Freitag Samstag Sonntag]
  
  # GET /calenders
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
    session[:vehicle_id] = params[:vehicle_id]
    @vehicle = Vehicle.find(params[:vehicle_id])
    @start = Date.commercial(session[:year],session[:cw],1)
    @calenders = Calender.search(params[:vehicle_id], session[:cw], session[:year]).order(date_from: :asc).page(params[:page]).per_page(10)
    @calanz = @calenders.count

  end

  # GET /calenders/1
  def show
  end

  # GET /calenders/new
  def new
    @calender = Calender.new
    @calender.vehicle_id = params[:vehicle_id]
    @calender.user_id = current_user.id
    @calender.active = true
    @calender.date_from = Date.today
    @calender.date_to = Date.today
    @calender.time_from = 8
    @calender.time_to = 12
    @calender.status = "new"
  end

  # GET /calenders/1/edit
  def edit
    @calender.status = "changed"
  end

  # POST /calenders
  def create(calender)
    @calender = Calender.new(calender)
    if @calender.save
      redirect_to vehicle_path(:id => @calender.vehicle_id, :topic => "Vehiclekalender"), notice: 'Calender was successfully created.'
    else
      render :new
    end
  end

  # PUT /calenders/1
  def update(calender)
    if @calender.update(calender)
      redirect_to vehicle_path(:id => @calender.vehicle_id, :topic => "Vehiclekalender"), notice: 'Calender was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /calenders/1
  def destroy
    @vehicle_id = @calender.vehicle_id
    @calender.destroy
    redirect_to vehicle_path(:id => @vehicle_id, :topic => "Vehiclekalender"), notice: 'Calender was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calender(id)
      @calender = Calender.find(id)
    end
end

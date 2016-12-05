class McalendarsController < ApplicationController
  before_action :set_mcalendar, only: [:show, :edit, :update, :destroy]

  # GET /mcalendars
  def index
    @mcalendars = Mcalendar.all
  end

  # GET /mcalendars/1
  def show
  end

  # GET /mcalendars/new
  def new
    @mcalendar = Mcalendar.new
    @mcalendar.mobject_id = params[:mobject_id]
    @mcalendar.user_id = current_user.id
    # @mcalendar.company_id = params[:company_id]
    @mcalendar.active = true
    @mcalendar.date_from = Date.today
    @mcalendar.date_to = Date.today
    @mcalendar.time_from = 8
    @mcalendar.time_to = 12
    @mcalendar.status = "new"
  end

  # GET /mcalendars/1/edit
  def edit
    @mcalendar.status = "changed"
  end

  # POST /mcalendars
  def create
    @mcalendar = Mcalendar.new(mcalendar_params)
    if @mcalendar.save
      redirect_to mobject_path(:id => @mcalendar.mobject_id, :topic => "Kalender", :year => session[:year], :cw => session[:cw]), notice: 'Calender entry was successfully created.'
    else
      render :new
    end
  end

  # PUT /mcalendars/1
  def update
    if @mcalendar.update(mcalendar_params)
      redirect_to mobject_path(:id => @mcalendar.mobject_id, :topic => "Kalender", :year => session[:year], :cw => session[:cw]), notice: 'Calender entry was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mcalendars/1
  def destroy
    @id = @mcalendar.mobject_id
    @mcalendar.destroy
      redirect_to mobject_path(:id => @id, :topic => "Kalender", :year => session[:year], :cw => session[:cw]), notice: 'Calender entry was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mcalendar
      @mcalendar = Mcalendar.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def mcalendar_params
      params.require(:mcalendar).permit(:mobject_id, :user_id, :company_id, :date_from, :date_to, :time_from, :time_to, :active, :status)
    end
    
end

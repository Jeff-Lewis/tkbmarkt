class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
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
    if params[:confirm_id]
      @appoint = Appointment.find(params[:confirm_id])
      if @appoint
        @appoint.status = "bestaetigt"
        @appoint.save
      end
    end
    if params[:deny_id]
      @appoint = Appointment.find(params[:deny_id])
      if @appoint
        @appoint.status = "leider nicht möglich"
        @appoint.save
      end
    end
    @start = Date.commercial(session[:year],session[:cw],1)
    @appointments = Appointment.search(params[:user_id1], session[:cw], session[:year]).order(app_date: :asc)
    @appanz = @appointments.count
    @user = User.find(params[:user_id1])
    @subject = params[:subject]
  end

  # GET /appointments/1
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
    @appointment.user_id1 = params[:user_id1]
    @appointment.user_id2 = params[:user_id2]
    @appointment.subject = params[:subject]
    @appointment.app_date = Date.today
    @appointment.time_from = 9
    @appointment.time_to = 10
    if @appointment.user_id1 == current_user.id
      @appointment.status = "nicht verfügbar"
    else
      @appointment.status = "angefragt"
    end
    @appointment.active = true
    @appointment.channel = "Geschäftstelle"
    @appointment.channel_detail = ""
    @appointment.reminder = true
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to user_path(:id => @appointment.user_id1, :topic => "Kalendereintraege"), notice: 'Appointment was successfully created.'
    else
      render :new
    end
  end

  # PUT /appointments/
  def update
    @appointment.subject = @appointment.subject + params[:time_from].to_s
    puts params[:time_to]
    if @appointment.update(appointment_params)
      redirect_to user_path(:id => @appointment.user_id1, :topic => "Kalendereintraege"), notice: 'Appointment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /appointments/1
  def destroy
    @usersave = @appointment.user_id1
    @appointment.destroy
    redirect_to user_path(:id => @usersave, :topic => "Kalendereintraege"), notice: 'Appointment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
      #@appointment.date_to = @appointment.date_from
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:channel, :channel_detail, :status, :active, :subject, :user_id1, :user_id2, :app_date, :time_from, :time_to, :reminder )
    end
    
end

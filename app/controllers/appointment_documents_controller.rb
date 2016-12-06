class AppointmentDocumentsController < ApplicationController
  before_action :set_appointment_document, only: [:show, :edit, :update, :destroy]

  # GET /appointment_documents
  def index
    @appointment_documents = AppointmentDocument.all
  end

  # GET /appointment_documents/1
  def show
  end

  # GET /appointment_documents/new
  def new
    @appointment_document = AppointmentDocument.new
    @appointment_document.appointment_id = params[:appointment_id]
  end

  # GET /appointment_documents/1/edit
  def edit
  end

  # POST /appointment_documents
  def create
    @appointment_document = AppointmentDocument.new(appointment_document_params)

    if @appointment_document.save
      redirect_to appointments_path :user_id1 => @appointment_document.appointment.user_id1, notice: 'Appointment document was successfully created.'
    else
      render :new
    end
  end

  # PUT /appointment_documents/1
  def update
    if @appointment_document.update(appointment_document_params)
      redirect_to appointments_path :user_id1 => @appointment_document.appointment.user_id1, notice: 'Appointment document was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /appointment_documents/1
  def destroy
    @user_id = @appointment_document.appointment.user_id1
    @appointment_document.destroy

    redirect_to appointments_path :user_id1 => @user_id, notice: 'Appointment document was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment_document
      @appointment_document = AppointmentDocument.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_document_params
      params.require(:appointment_document).permit(:appointment_id, :name, :description, :document )
    end

end

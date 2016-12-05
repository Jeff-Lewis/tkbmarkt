class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tickets
  def index
    @msponsor = Msponsor.find(params[:msponsor_id])
    @tickets = Ticket.where('msponsor_id=?',params[:msponsor_id]).limit(5)
    @ticanz = @tickets.count
    
    if params[:ticket_id]
      @searches = Search.where('ticket_id=?', params[:ticket_id])
      @searches.each do |s|
        @users = User.where(s.sql_string)
        @users.each do |u|
          userticket = UserTicket.new
          userticket.user_id = u.id
          userticket.ticket_id = params[:ticket_id]
          userticket.status = "überreicht"
          userticket.save
        end
      end
    end
  end

  # GET /tickets/1
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    @ticket.msponsor_id = params[:msponsor_id]
    @ticket.active = true
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to tickets_path :msponsor_id => @ticket.msponsor_id, notice: 'Ticket was successfully created.'
    else
      render :new
    end
  end

  # PUT /tickets/1
  def update
    if @ticket.update(ticket_params)
      redirect_to tickets_path :msponsor_id => @ticket.msponsor_id, notice: 'Ticket was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tickets/1
  def destroy
    @msponsor_id = @ticket.msponsor_id
    @ticket.destroy
    redirect_to tickets_path :msponsor_id => @msponsor_id, notice: 'Ticket was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:msponsor_id, :mcategory_id, :name, :description, :amount, :contingent, :active)
    end
end

class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]

  # GET /searches
  def index
    if params[:search_domain]
      @search_domain = params[:search_domain]
    end
    if params[:controller_name]
      @controller_name = params[:controller_name]
    end
    if params[:mtype]
      @mtype = params[:mtype]
    end
    if params[:msubtype]
      @msubtype = params[:msubtype]
    end
    if params[:ticket_id]
      @ticket = Ticket.find(params[:ticket_id])
      @searches = Search.where('ticket_id=?', params[:ticket_id])
      if params[:generate]
        #userticket = UserTicket.where('ticket_id=? and status=?', params[:ticket_id], "Filter Kampagne").destroy_all
        @searches.each do |s|
          @users = User.where(s.sql_string)
          @users.each do |u|
            if UserTicket.where('user_id=? and ticket_id=?', u.id, params[:ticket_id]).count == 0
              userticket = UserTicket.new
              userticket.user_id = u.id
              userticket.ticket_id = params[:ticket_id]
              userticket.status = "Filter Kampagne"
              userticket.save
            end
          end
        end
      end

      if params[:activate]
        @usertickets = UserTicket.where('ticket_id=? and status=?', params[:ticket_id], "Filter Kampagne")
        @usertickets.each do |ut|
          ut.status = "übergeben"
          ut.save
        end
      end

      if params[:remove]
        @usertickets = UserTicket.where('ticket_id=?', params[:ticket_id]).destroy_all
      end

    else
      if @msubtype
        @searches = Search.where('search_domain=? and user_id=? and mtype=? and msubtype=?', params[:search_domain], current_user.id, @mtype, @msubtype).page(params[:page]).per_page(10)
      else
        if @mtype
          @searches = Search.where('search_domain=? and user_id=? and mtype=?', params[:search_domain], current_user.id, @mtype).page(params[:page]).per_page(10)
        else
          @searches = Search.where('search_domain=? and user_id=?', params[:search_domain], current_user.id).page(params[:page]).per_page(10)
        end
      end
    end
    @seranz = @searches.count
    if @usertickets
      @counter = @usertickets.count
    end
    
  end

  # GET /searches/1
  def show
  end

  # GET /searches/new
  def new
    @search = Search.new
    @search.name = "Meine Abfrage..."+params[:search_domain]
    @search.sql_string = []
    @search.search_domain = params[:search_domain]
    @search.mtype = params[:mtype]
    @search.msubtype = params[:msubtype]
    @search.user_id = params[:user_id]
    @search.controller = params[:controller_name]
    @search.distance = 10
    @search.age_from = 0
    @search.age_to = 0
    @search.social = false
    @search.customer = false
    @search.special = false
    @search.amount_from_target = "10000"
    @search.amount_to_target = "50000"
    @search.amount_from = "5000"
    @search.amount_to = "10000"
    if params[:ticket_id] != nil
      @ticket = Ticket.find(params[:ticket_id])
      @search.ticket_id = @ticket.id
      @search.name = @ticket.msponsor.mobject.name + " Umkreissuche" 
      @search.longitude = @ticket.msponsor.mobject.longitude
      @search.latitude= @ticket.msponsor.mobject.latitude
      @search.address1 = @ticket.msponsor.mobject.address1
      @search.address2 = @ticket.msponsor.mobject.address2
      @search.address3 = @ticket.msponsor.mobject.address3
      @search.distance = 10
    else
      @search.longitude = current_user.longitude
      @search.latitude= current_user.latitude
      @search.address1 = current_user.address1
      @search.address2 = current_user.address2
      @search.address3 = current_user.address3
    end
  end

  # GET /searches/1/edit
  def edit
  end

  # POST /searches
  def create
    @search = Search.new(search_params)
    if @search.save
        redirect_to searches_path(:user_id => current_user.id, :search_domain => @search.search_domain, :mtype => @search.mtype, :msubtype => @search.msubtype, :controller_name => @search.controller, :ticket_id => @search.ticket_id), notice: 'Search was successfully updated.'
    else
      render :new
    end
  end

  # PUT /searches/1
  def update
    if @search.update(search_params)
        redirect_to searches_path(:user_id => current_user.id, :search_domain => @search.search_domain, :mtype => @search.mtype, :msubtype => @search.msubtype, :controller_name => @search.controller, :ticket_id => @search.ticket_id), notice: 'Search was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /searches/1
  def destroy
    if @search.ticket_id
      ticket_id = @search.ticket_id
    else
      ticket_id = nil
    end
    @save_mtype = @search.mtype
    @save_msubtype = @search.msubtype
    @save_search_domain = @search.search_domain
    @save_search_controller = @search.search_controller
    
    @search.destroy
    redirect_to searches_path(:user_id => current_user.id, :search_domain => @save_search_domain, :controller_name => @save_search_controller, :mtype => @save_search_mtype, :msubtype => @save_search_msubtype, :ticket_id => ticket_id), notice: 'Search was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
      @search.build_sql
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:counter, :ticket_id, :mtype, :msubtype, :date_from, :date_to, :search_domain, :controller, :user_id, :name, :description, :status, :mcategory_id, :keywords, :age_from, :age_to, :distance, :geo_address, :address1, :address2, :address3, :date_created_at, :rating, :social, :customer, :amount_from, :amount_to, :amount_from_target, :amount_to_target, :special)
    end
end

class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  def index
    @partners = Company.where('partner=? and active=?', true, true).page(params[:page]).per_page(10)
    @paranz = @partners.count
  end

  # GET /customers/1
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    if params[:user_id]
      @customer.owner_id = params[:user_id]
      @customer.owner_type = "User"
    end
    if params[:company_id]
      @customer.owner_id = params[:company_id]
      @customer.owner_type = "Company"
    end
    @customer.partner_id = params[:partner_id]
    @customer.newsletter = true
    @customer.tickets = true
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      if @customer.owner_type == "User" 
        redirect_to user_path(:id => @customer.owner_id, :topic => "Kundenstatus"), notice: 'Customer was successfully created.'
      else
        redirect_to company_path(:id => @customer.owner_id, :topic => "Kundenstatus"), notice: 'Customer was successfully created.'
      end
    else
      render :new
    end
  end

  # PUT /customers/1
  def update
    if @customer.update(customer_params)
      if @customer.owner_type == "Company"
        redirect_to user_path(:id => @customer.owner_id, :topic => "Kundenstatus"), notice: 'Customer was successfully created.'
      else
        redirect_to company_path(:id => @customer.owner_id, :topic => "Kundenstatus"), notice: 'Customer was successfully created.'
      end
    else
      render :edit
    end
  end

  # DELETE /customers/1
  def destroy
    @owner_id = @customer.owner_id
    @owner_type = @customer.owner_type
    @customer.destroy
      if @owner_type == "User"
        redirect_to user_path(:id => @owner_id, :topic => "Kundenstatus"), notice: 'Customer was successfully created.'
      end
      if @owner_type == "Company"
        redirect_to company_path(:id => @owner_id, :topic => "Kundenstatus"), notice: 'Customer was successfully created.'
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:customer_number, :partner_id, :owner_id, :owner_type, :tickets, :advisor_id, :newsletter)
    end
    
end

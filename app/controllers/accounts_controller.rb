class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  def index
    @accounts = Account.where('customer_id=?', params[:customer_id])
    @accanz = @accounts.count
    @customer = Customer.find(params[:customer_id])
    if @customer.owner_type == "User"
      @item = User.find(@customer.owner_id)
      @header = @item.name + " " + @item.lastname
    else
      @item = Company.find(@customer.owner_id)
      @header = @item.name
    end
    @partner = Company.find(@customer.partner_id)
  end

  # GET /accounts/1
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
    @account.customer_id = params[:customer_id]
    @account.is_account_ver = true
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  def create
    @account = Account.new(account_params)

    if @account.save
      redirect_to accounts_path :customer_id => @account.customer_id, notice: 'Account was successfully created.'
    else
      render :new
    end
  end

  # PUT /accounts/1
  def update
    if @account.update(account_params)
      redirect_to accounts_path :customer_id => @account.customer_id, notice: 'Account was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /accounts/1
  def destroy
    @customer_id = @account.customer_id
    @account.destroy
    redirect_to accounts_path :customer_id => @customer_id, notice: 'Account was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:customer_id, :iban, :is_account_ver, :name )
    end
    
    
end

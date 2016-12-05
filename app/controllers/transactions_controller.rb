class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  def show
  end

  # GET /transactions/new
  def new
    
    @transaction = Transaction.new
    if params[:user_id]
      @transaction.owner_id = params[:user_id]
      @transaction.owner_type = "User"
    end
    if params[:company_id]
      @transaction.owner_id = params[:company_id]
      @transaction.owner_type = "Company"
    end
    @transaction.ttype = "Payment"
    @transaction.trx_date = Date.today
    @transaction.valuta = Date.today
    @transaction.amount = params[:amount]
    @transaction.account_bel = params[:account_bel]
    @transaction.status = "erfasst"
    @transaction.ref = params[:ref]
    @transaction.text = ""

    @transaction.object_id = params[:object_id].to_i
    @transaction.object_name = params[:object_name]
    @item = Object.const_get(params[:object_name]).find(params[:object_id])
    
    # Vergütungskonto 
    if params[:user_id_ver]
      @user = User.find(params[:user_id_ver])
      @partners = Company.where('partner=?',true)
      @partners.each do |p|
        @customer = @user.customers.where("partner_id=?", p.id).first
        if @customer
          @account = @customer.accounts.where('is_account_ver=?',true).first
          if @account != nil
            @transaction.account_ver = @account.id
            @bv_1 = @user.name + " " + @user.lastname
            @bv_2 = @account.name
            @bv_3 = @account.iban
          end
        end
      end
    end
    if params[:company_id_ver]
      @company = Company.find(params[:company_id_ver])
      @partners = Company.where('partner=?',true)
      @partners.each do |p|
        @customer = @company.customers.where("partner_id=?", p.id).first
        if @customer
          @account = @customer.accounts.where('is_account_ver=?',true).first
          if @account != nil
            @transaction.account_ver = @account.id
            @bv_1 = @company.name
            @bv_2 = @account.name
            @bv_3 = @account.iban
          end
        end
      end
    end
    if !@account
      redirect_to @item, notice: 'no counterpart account defined, trx not possible'
      return
    end
    
  end

  # GET /transactions/1/edit
  def edit
    @account = Account.find(@transaction.account_ver)
    if params[:user_id]
      @user = User.find(params[:user_id])
      @ali = []
      @partners = Company.where('partner=?',true)
      @partners.each do |p|
        @customer = @user.customers.where("partner_id=?", p.id).first
        if @customer
          @customer.accounts.each do |ca|
            @ali << ca.id
          end
        end
      end
    end
    if params[:company_id]
      @company = Company.find(params[:company_id])
      @ali = []
      @partners = Company.where('partner=?',true)
      @partners.each do |p|
        @customer = @company.customers.where("partner_id=?", p.id).first
        if @customer
          @customer.accounts.each do |ca|
            @ali << ca.id
          end
        end
      end
    end
  end

  # POST /transactions
  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      if @transaction.owner_type == "User" 
        redirect_to user_path(:id => @transaction.owner_id, :topic => "Transaktionen"), notice: 'Trx was successfully created.'
      else
        redirect_to company_path(:id => @transaction.owner_id, :topic => "Transaktionen"), notice: 'Trx was successfully created.'
      end
    else
      render :new
    end
  end

  # PUT /transactions/1
  def update
    if @transaction.update(transaction_params)
      if @transaction.owner_type == "User" 
        redirect_to user_path(:id => @transaction.owner_id, :topic => "Transaktionen"), notice: 'Trx was successfully updated.'
      else
        redirect_to company_path(:id => @transaction.owner_id, :topic => "Transaktionen"), notice: 'Trx was successfully updated.'
      end
    end
  end

  # DELETE /transactions/1
  def destroy
    @owner_id = @transaction.owner_id
    @owner_type = @transaction.owner_type
    @transaction.destroy
    if @owner_type == "User"
      redirect_to user_path(:id => @owner_id, :topic => "Transaktionen"), notice: 'Customer was successfully created.'
    end
    if @owner_type == "Company"
      redirect_to company_path(:id => @owner_id, :topic => "Transaktionen"), notice: 'Customer was successfully created.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:account_ver, :account_bel, :valuta, :trx_date, :owner_id, :owner_type, :ttype, :status, :active, :text, :ref, :amount, :object_name, :object_id)
    end

end

class CustomerAdvisorController < ApplicationController
  def index
    @customer = Customer.find(params[:customer_id])
    @advisor_id = @customer.advisor_id
    if @customer.company_id
      @name = @customer.company.name
    end
    if @customer.user_id
      @name = @customer.user.name + " " + @customer.user.lastname
    end
    @services = Service.where('company_id=?', @customer.partner_id)
    @array=[]
    @services.each do |s|
      @array << s.id
    end
    @users = User.where('id IN (SELECT user_id FROM advisors WHERE service_id IN (?))',@array).page(params[:page]).per_page(20)
    @usanz = @users.count
    if params[:customer_advisor_id]
      @customer.advisor_id  = params[:customer_advisor_id]
      @customer.save
    end
    if params[:delete_customer_advisor_id]
      @customer.advisor_id  = nil
      @customer.save
    end
    if params[:customer_advisor_id] or params[:delete_customer_advisor_id]
        redirect_to customer_advisor_index2_path :partner_id => @customer.partner_id, :page => session[:page]
    end
    
  end
  
  def index2
    if params[:search]
      session[:search] = params[:search]
    end
    @company = Company.find(params[:partner_id])
    @customers = Customer.where('partner_id=?', params[:partner_id]).page(params[:page]).per_page(10)
    @cusanz = @customers.count
    #User.search(false, session[:search]).page(params[:page]).per_page(10)
  end
end

class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  $branchen_codes = []

  # GET /companies
  def index
    
    if params[:page]
      session[:page] = params[:page]
    end
    
    @companies = Company.search(params[:filter_id], params[:search]).page(params[:page]).per_page(16)
    @companz = @companies.count
   counter = 0 
   @locs = "["
   @wins = "["
   @companies.each do |c|
      @locs = @locs + "["
      @locs = @locs + "'" + c.name + "', "
      @locs = @locs + c.latitude.to_s + ", "
      @locs = @locs + c.longitude.to_s
      if counter+1 == @companz
        @locs = @locs + "]"
      else
        @locs = @locs + "],"
      end

      @wins = @wins + "["
      @wins = @wins + "'<img src=" + c.avatar(:small) + "<br><h3>" + c.name + "</h3><p>" + c.geo_address + "</p>'"
      if counter+1 == @campanz
        @wins = @wins + "]"
      else
        @wins = @wins + "],"
      end

      counter = counter + 1
    end
    @locs = @locs + "]"
    @wins = @wins + "]"
    
  end

  # GET /companies/1
  def show
    if params[:topic]
      @topic = params[:topic]
    else
      @topic = "Company"
    end

    @array_s = ""
    @array_s = @company.build_stats(@array_s, @company.mobjects.where('mtype=?','Angebote'), "Angebote" )
    @array_s = @company.build_stats(@array_s, @company.mobjects.where('mtype=?','Kleinanzeigen'), "Kleinanzeigen" )
    @array_s = @company.build_stats(@array_s, @company.mobjects.where('mtype=?','Vermietungen'), "Vermietungen" )
    @array_s = @company.build_stats(@array_s, @company.mobjects.where('mtype=?','Veranstaltungen'), "Veranstaltungen" )
    @array_s = @company.build_stats(@array_s, @company.msponsors, "Sponsorenengagements" ) 
    @array_s = @company.build_stats(@array_s, @company.mobjects.where('mtype=?','Ausschreibungen'), "Ausschreibungen" )
    @array_s = @company.build_stats(@array_s, @company.mobjects.where('mtype=?','Ausflugsziele'), "Ausflugsziele" )
    @array_s = @company.build_stats(@array_s, @company.mobjects.where('mtype=?','Stellenanzeigen'), "Stellenanzeigen" )
    @array_s = @company.build_stats(@array_s, @company.mobjects.where('mtype=?','Crowdfunding'), "Crowdfunding" )
    @array_s = @company.build_stats(@array_s, @company.mstats, "Crowdfunding Beitraege" )            if false
    @array_s = @company.build_stats(@array_s, @company.customers, "Kundenstatus" )
    @array_s = @company.build_stats(@array_s, @company.transactions.where('ttype=?', "Payment"), "Transaktionen" )
    @array_s = @company.build_stats(@array_s, Email.where('m_to=? or m_from=?', @company.user.id, @company.user.id), "Nachrichten" )
    @array_s = @company.build_stats(@array_s, @company.user.searches, "Abfragen" )
    @array_s = @array_s[0, @array_s.length - 1]

  end

  # GET /companies/new
  def new
      @company = Company.new
      @company.user_id = params[:user_id]
      @company.active = true
      @company.social = false
      @company.status = "new"
      @company.partner = false
  end

  # GET /companies/1/edit
  def edit
    @company.status = "changed"
  end

  # POST /companies
  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to user_path(:id => @company.user_id, :topic => "Institutionen"), notice: 'Company was successfully created'
      # redirect_to @company, notice: 'Company was successfully created.'
    else
      render :new
    end
  end

  # PUT /companies/1
  def update
    if @company.update(company_params)
      redirect_to @company, notice: 'Company was successfully updated'
    else
      render :edit
    end
  end

  # DELETE /companies/1
  def destroy
    @us = @company.user_id
    @company.destroy
    redirect_to user_path(:id => @us, :topic => "Institutionen"),  notice: 'Company was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end
    
    def company_params
      params.require(:company).permit(:partner, :status, :active, :name, :homepage, :mcategory_id, :social, :stichworte, :user_id, :description, :address1, :address2, :address3, :geo_address, :longitude, :latitude, :phone1, :phone2, :avatar, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at)
    end

end

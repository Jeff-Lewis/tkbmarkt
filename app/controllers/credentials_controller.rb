class CredentialsController < ApplicationController
  before_action :set_credential, only: [:show, :edit, :update, :destroy]

  # GET /credentials
  # GET /credentials.json
  def index
    
    if params[:id]
      @c = Credential.find(params[:id])
      if @c
        #@c.edit
        if @c.access
          @c.access=false
        else
          @c.access=true
        end
        @c.save
      end
    end

    if params[:user_id]
      @user = User.find(params[:user_id])
      @credentials = @user.credentials
    end
    if !@credentials
        load(params[:user_id])
        @credentials = Credential.all
    end

  end

  def load(user_id)

    @array = []
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Info", "icon" => "user", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Kalendereintraege", "icon" => "calendar", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Angebote", "icon" => "shopping-cart", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Aktionen", "icon" => "shopping-cart", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Ansprechpartner", "icon" => "question-sign", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Institutionen", "icon" => "copyright-mark", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Stellenanzeigen", "icon" => "briefcase", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Kleinanzeigen", "icon" => "pushpin", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Vermietungen", "icon" => "retweet", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Veranstaltungen", "icon" => "glass", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Tickets", "icon" => "barcode", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Ausflugsziele", "icon" => "camera", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Ausschreibungen", "icon" => "pencil", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Crowdfunding (Spenden)", "icon" => "grain", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Crowdfunding (Belohnungen)", "icon" => "grain", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Crowdfunding (Zinsen)", "icon" => "grain", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Crowdfunding (Beiträge)", "icon" => "gift", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Bewertungen", "icon" => "star", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Favoriten", "icon" => "heart", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Kundenbeziehungen", "icon" => "check", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Kontobeziehungen", "icon" => "th-list", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Transaktionen", "icon" => "euro", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "eMail", "icon" => "envelope", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Positionen Privatperson", "icon" => "map-marker", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Positionen Favoriten", "icon" => "map-marker", "access" => "true"}
    @array << hash
    
    hash = Hash.new
    hash = {"domain" => "Institutionen", "right" => "Info", "icon" => "copyright-mark", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Institutionen", "right" => "Angebote", "icon" => "shopping-cart", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Institutionen", "right" => "Aktionen", "icon" => "shopping-cart", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Institutionen", "right" => "Stellenanzeigen", "icon" => "briefcase", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Institutionen", "right" => "Kleinanzeigen", "icon" => "pushpin", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Institutionen", "right" => "Vermietungen", "icon" => "retweet", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Institutionen", "right" => "Veranstaltungen", "icon" => "glass", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Institutionen", "right" => "Sponsorenengagements", "icon" => "barcode", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Institutionen", "right" => "Ausflugsziele", "icon" => "camera", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Institutionen", "right" => "Ausschreibungen", "icon" => "pencil", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Institutionen", "right" => "Crowdfunding (Spenden)", "icon" => "grain", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Institutionen", "right" => "Crowdfunding (Belohnungen)", "icon" => "grain", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Institutionen", "right" => "Crowdfunding (Zinsen)", "icon" => "grain", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Institutionen", "right" => "Crowdfunding (Beiträge)", "icon" => "gift", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Institutionen", "right" => "Kundenbeziehungen", "icon" => "check", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Institutionen", "right" => "Kontobeziehungen", "icon" => "th-list", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Institutionen", "right" => "Transaktionen", "icon" => "euro", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Institutionen", "right" => "eMail", "icon" => "envelope", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Institutionen", "right" => "Links Partner", "icon" => "globe", "access" => "true"}
    @array << hash
    
    hash = Hash.new
    hash = {"domain" => "Objekte", "right" => "Info", "icon" => "search", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Objekte", "right" => "Kalender Vermietungen", "icon" => "calendar", "access" => "true"}
    @array << hash
    
    for i in 0..@array.length-1
      c = Credential.new
      c.user_id = user_id
      c.domain = @array[i]["domain"]
      c.right = @array[i]["right"]
      c.icon = @array[i]["icon"]
      c.access = @array[i]["access"]
      c.save
    end
  end
  
  # GET /credentials/1
  # GET /credentials/1.json
  def show
  end

  # GET /credentials/new
  def new
    @credential = Credential.new
  end

  # GET /credentials/1/edit
  def edit
  end

  # POST /credentials
  # POST /credentials.json
  def create
    @credential = Credential.new(credential_params)

    respond_to do |format|
      if @credential.save
        format.html { redirect_to @credential, notice: 'Credential was successfully created.' }
        format.json { render :show, status: :created, location: @credential }
      else
        format.html { render :new }
        format.json { render json: @credential.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credentials/1
  # PATCH/PUT /credentials/1.json
  def update
    respond_to do |format|
      if @credential.update(credential_params)
        format.html { redirect_to @credential, notice: 'Credential was successfully updated.' }
        format.json { render :show, status: :ok, location: @credential }
      else
        format.html { render :edit }
        format.json { render json: @credential.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credentials/1
  # DELETE /credentials/1.json
  def destroy
    @credential.destroy
    respond_to do |format|
      format.html { redirect_to credentials_url, notice: 'Credential was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credential
      @credential = Credential.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credential_params
      params.require(:credential).permit(:domain, :user_id, :right, :access)
    end
end

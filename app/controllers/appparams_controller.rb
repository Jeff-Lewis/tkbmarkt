class AppparamsController < ApplicationController
  before_action :set_appparam, only: [:show, :edit, :update, :destroy]

  # GET /appparams
  def index
    if params[:id]
      @c = Appparam.find(params[:id])
      if @c
        if @c.access
          @c.access=false
        else
          @c.access=true
        end
        @c.save
      end
    end

    @appparams = Appparam.all
    if @appparams.count == 0
        init
        @appparams = Appparam.all
    end

  end

  def init

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
    hash = {"domain" => "Privatpersonen", "right" => "Crowdfunding (Beitraege)", "icon" => "gift", "access" => "true"}
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
    hash = {"domain" => "Privatpersonen", "right" => "Positionen (Privatpersonen)", "icon" => "map-marker", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Positionen (Favoriten)", "icon" => "map-marker", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Privatpersonen", "right" => "Aktivitaeten", "icon" => "dashboard", "access" => "true"}
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
    hash = {"domain" => "Institutionen", "right" => "Crowdfunding (Beitraege)", "icon" => "gift", "access" => "true"}
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
    hash = {"domain" => "Institutionen", "right" => "Links (Partner)", "icon" => "globe", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Institutionen", "right" => "Aktivitaeten", "icon" => "dashboard", "access" => "true"}
    @array << hash
    
    hash = Hash.new
    hash = {"domain" => "Objekte", "right" => "Info", "icon" => "search", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Objekte", "right" => "Details", "icon" => "book", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Objekte", "right" => "Sponsorenengagements", "icon" => "heart", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Objekte", "right" => "Ansprechpartner", "icon" => "user", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Objekte", "right" => "Kalender", "icon" => "calendar", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Objekte", "right" => "Ausschreibungsangebote", "icon" => "inbox", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Objekte", "right" => "Bewertungen", "icon" => "star", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Objekte", "right" => "CF Statistik", "icon" => "stats", "access" => "true"}
    @array << hash
    hash = Hash.new
    hash = {"domain" => "Objekte", "right" => "CF Transaktionen", "icon" => "euro", "access" => "true"}
    @array << hash
    
    for i in 0..@array.length-1
      c = Appparam.new
      c.domain = @array[i]["domain"]
      c.right = @array[i]["right"]
      c.icon = @array[i]["icon"]
      c.access = @array[i]["access"]
      c.save
    end
  end

  # GET /appparams/1
  def show
  end

  # GET /appparams/new
  def new
    @appparam = Appparam.new
  end

  # GET /appparams/1/edit
  def edit
  end

  # POST /appparams
  def create
    @appparam = Appparam.new(appparam_params)

    if @appparam.save
      redirect_to appparams_path :page => session[:page], notice: 'Appparam was successfully created.'
    else
      render :new
    end
  end

  # PUT /appparams/1
  def update
    if @appparam.update(appparam_params)
      redirect_to appparams_path :page => session[:page], notice: 'Appparam was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /appparams/1
  def destroy
    @appparam.destroy
    redirect_to appparams_path :page => session[:page], notice: 'Appparam was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appparam
      @appparam = Appparam.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def appparam_params
      params.require(:appparam).permit(:domain, :icon, :right, :access)
    end
    
    
end

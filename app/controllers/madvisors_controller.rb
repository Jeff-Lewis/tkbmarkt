class MadvisorsController < ApplicationController
  before_action :set_madvisor, only: [:show, :edit, :update, :destroy]

  # GET /madvisors
  def index
    if params[:search]
      session[:search] = params[:search]
    end
    if params[:mobject_id]
      session[:mobject_id] = params[:mobject_id]
    end
    if params[:page]
      session[:page] = params[:page]
    end
    
    if params[:madvisor_id]
      @madvisor = Madvisor.where('mobject_id=? and user_id=?', session[:mobject_id], params[:madvisor_id]).first
      if !@madvisor
        @madvisor = Madvisor.new
        @madvisor.user_id = params[:madvisor_id]
        @madvisor.mobject_id = session[:mobject_id]
      end
      @madvisor.grade = "Berater"
      @madvisor.save
    end
    if params[:senior_madvisor_id]
      @madvisor = Madvisor.where('mobject_id=? and user_id=?', session[:mobject_id], params[:senior_madvisor_id]).first
      if !@madvisor
        @madvisor = Madvisor.new
        @madvisor.user_id = params[:senior_madvisor_id]
        @madvisor.mobject_id = session[:mobject_id]
      end
      @madvisor.grade = "Senior Berater"
      @madvisor.save
    end
    if params[:delete_madvisor_id]
      @madvisor = Madvisor.where('mobject_id=? and user_id=?', session[:mobject_id], params[:delete_madvisor_id]).first
      if @madvisor
        @madvisor.destroy
      end
    end

    @users = User.search(false, session[:search]).page(params[:page]).per_page(10)
    @madvisors = Madvisor.where('mobject_id=?', session[:mobject_id])
    @mobject = Mobject.find(session[:mobject_id])
    @array=[]
    @madvisors.each do |ad|
      hash = Hash.new
      hash = {"key" => ad.user_id, "grade" => ad.grade}
      @array << hash
    end

  end

  # GET /madvisors/1
  def show
  end

  # GET /madvisors/new
  def new
    @madvisor = Madvisor.new
    @madvisor.mobject_id = params[:mobject_id]
    @madvisor.user_id = params[:user_id]
    @madvisor.grade = params[:grade]
  end

  # GET /madvisors/1/edit
  def edit
  end

  # POST /madvisors
  def create
    @madvisor = Madvisor.new(madvisor_params)
    if @madvisor.save
      redirect_to mobject_path(:id => @madvisors.mobject_id, :topic => "Advisors"), notice: 'Ansprechpartner was successfully created.'
    else
      render :new
    end
  end

  # PUT /madvisors/1
  def update
    if @madvisor.update(madvisor_params)
      redirect_to mobject_path(:id => @madvisors.mobject_id, :topic => "Advisors"), notice: 'Ansprechpartner was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /madvisors/1
  def destroy
    @id = @madvisors.mobject_id
    @madvisor.destroy
      redirect_to mobject_path(:id => @id, :topic => "Advisors"), notice: 'Ansprechpartner was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_madvisor
      @madvisor = Madvisor.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def madvisor_params
      params.require(:madvisor).permit(:mobject_id, :user_id, :grade)
    end
    
    
end

class McategoriesController < ApplicationController
  before_action :set_mcategory, only: [:show, :edit, :update, :destroy]
  permits :status

  # GET /mcategories
  def index
    @mcategories = Mcategory.all
  end

  # GET /mcategories/1
  def show
  end

  # GET /mcategories/new
  def new
    @mcategory = Mcategory.new
  end

  # GET /mcategories/1/edit
  def edit
  end

  # POST /mcategories
  def create(mcategory)
    @mcategory = Mcategory.new(mcategory)

    if @mcategory.save
      redirect_to @mcategory, notice: 'Mcategory was successfully created.'
    else
      render :new
    end
  end

  # PUT /mcategories/1
  def update(mcategory)
    if @mcategory.update(mcategory)
      redirect_to @mcategory, notice: 'Mcategory was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mcategories/1
  def destroy
    @mcategory.destroy

    redirect_to mcategories_url, notice: 'Mcategory was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mcategory(id)
      @mcategory = Mcategory.find(id)
    end
end

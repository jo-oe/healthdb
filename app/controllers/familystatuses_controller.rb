class FamilystatusesController < ApplicationController
  before_filter :authorize_admin
  before_action :set_familystatus, only: [:show, :edit, :update, :destroy]

  # GET /familystatuses
  # GET /familystatuses.json
  def index
    @familystatuses = Familystatus.all
  end

  # GET /familystatuses/1
  # GET /familystatuses/1.json
  def show
  end

  # GET /familystatuses/new
  def new
    @familystatus = Familystatus.new
  end

  # GET /familystatuses/1/edit
  def edit
  end

  # POST /familystatuses
  # POST /familystatuses.json
  def create
    @familystatus = Familystatus.new(familystatus_params)

    respond_to do |format|
      if @familystatus.save
        format.html { redirect_to @familystatus, notice: 'Familystatus was successfully created.' }
        format.json { render :show, status: :created, location: @familystatus }
      else
        format.html { render :new }
        format.json { render json: @familystatus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /familystatuses/1
  # PATCH/PUT /familystatuses/1.json
  def update
    respond_to do |format|
      if @familystatus.update(familystatus_params)
        format.html { redirect_to @familystatus, notice: 'Familystatus was successfully updated.' }
        format.json { render :show, status: :ok, location: @familystatus }
      else
        format.html { render :edit }
        format.json { render json: @familystatus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /familystatuses/1
  # DELETE /familystatuses/1.json
  def destroy
    @familystatus.destroy
    respond_to do |format|
      format.html { redirect_to familystatuses_url, notice: 'Familystatus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_familystatus
      @familystatus = Familystatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def familystatus_params
      params.require(:familystatus).permit(:code, :text)
    end
end

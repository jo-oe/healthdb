class HomeplacesController < ApplicationController
  before_filter :authorize_admin
  before_action :set_homeplace, only: [:show, :edit, :update, :destroy]

  # GET /homeplaces
  # GET /homeplaces.json
  def index
    @homeplaces = Homeplace.all
  end

  # GET /homeplaces/1
  # GET /homeplaces/1.json
  def show
  end

  # GET /homeplaces/new
  def new
    @homeplace = Homeplace.new
  end

  # GET /homeplaces/1/edit
  def edit
  end

  # POST /homeplaces
  # POST /homeplaces.json
  def create
    @homeplace = Homeplace.new(homeplace_params)

    respond_to do |format|
      if @homeplace.save
        format.html { redirect_to @homeplace, notice: 'Homeplace was successfully created.' }
        format.json { render :show, status: :created, location: @homeplace }
      else
        format.html { render :new }
        format.json { render json: @homeplace.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homeplaces/1
  # PATCH/PUT /homeplaces/1.json
  def update
    respond_to do |format|
      if @homeplace.update(homeplace_params)
        format.html { redirect_to @homeplace, notice: 'Homeplace was successfully updated.' }
        format.json { render :show, status: :ok, location: @homeplace }
      else
        format.html { render :edit }
        format.json { render json: @homeplace.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homeplaces/1
  # DELETE /homeplaces/1.json
  def destroy
    @homeplace.destroy
    respond_to do |format|
      format.html { redirect_to homeplaces_url, notice: 'Homeplace was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homeplace
      @homeplace = Homeplace.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def homeplace_params
      params.require(:homeplace).permit(:code, :text)
    end
end

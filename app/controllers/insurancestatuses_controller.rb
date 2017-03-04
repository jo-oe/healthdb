class InsurancestatusesController < ApplicationController
  before_action :set_insurancestatus, only: [:show, :edit, :update, :destroy]

  # GET /insurancestatuses
  # GET /insurancestatuses.json
  def index
    @insurancestatuses = Insurancestatus.all
  end

  # GET /insurancestatuses/1
  # GET /insurancestatuses/1.json
  def show
  end

  # GET /insurancestatuses/new
  def new
    @insurancestatus = Insurancestatus.new
  end

  # GET /insurancestatuses/1/edit
  def edit
  end

  # POST /insurancestatuses
  # POST /insurancestatuses.json
  def create
    @insurancestatus = Insurancestatus.new(insurancestatus_params)

    respond_to do |format|
      if @insurancestatus.save
        format.html { redirect_to @insurancestatus, notice: 'Insurancestatus was successfully created.' }
        format.json { render :show, status: :created, location: @insurancestatus }
      else
        format.html { render :new }
        format.json { render json: @insurancestatus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insurancestatuses/1
  # PATCH/PUT /insurancestatuses/1.json
  def update
    respond_to do |format|
      if @insurancestatus.update(insurancestatus_params)
        format.html { redirect_to @insurancestatus, notice: 'Insurancestatus was successfully updated.' }
        format.json { render :show, status: :ok, location: @insurancestatus }
      else
        format.html { render :edit }
        format.json { render json: @insurancestatus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insurancestatuses/1
  # DELETE /insurancestatuses/1.json
  def destroy
    @insurancestatus.destroy
    respond_to do |format|
      format.html { redirect_to insurancestatuses_url, notice: 'Insurancestatus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insurancestatus
      @insurancestatus = Insurancestatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def insurancestatus_params
      params.require(:insurancestatus).permit(:code, :text)
    end
end

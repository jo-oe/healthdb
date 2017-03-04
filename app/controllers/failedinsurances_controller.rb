class FailedinsurancesController < ApplicationController
  before_action :set_failedinsurance, only: [:show, :edit, :update, :destroy]

  # GET /failedinsurances
  # GET /failedinsurances.json
  def index
    @failedinsurances = Failedinsurance.all
  end

  # GET /failedinsurances/1
  # GET /failedinsurances/1.json
  def show
  end

  # GET /failedinsurances/new
  def new
    @failedinsurance = Failedinsurance.new
  end

  # GET /failedinsurances/1/edit
  def edit
  end

  # POST /failedinsurances
  # POST /failedinsurances.json
  def create
    @failedinsurance = Failedinsurance.new(failedinsurance_params)

    respond_to do |format|
      if @failedinsurance.save
        format.html { redirect_to @failedinsurance, notice: 'Failedinsurance was successfully created.' }
        format.json { render :show, status: :created, location: @failedinsurance }
      else
        format.html { render :new }
        format.json { render json: @failedinsurance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /failedinsurances/1
  # PATCH/PUT /failedinsurances/1.json
  def update
    respond_to do |format|
      if @failedinsurance.update(failedinsurance_params)
        format.html { redirect_to @failedinsurance, notice: 'Failedinsurance was successfully updated.' }
        format.json { render :show, status: :ok, location: @failedinsurance }
      else
        format.html { render :edit }
        format.json { render json: @failedinsurance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /failedinsurances/1
  # DELETE /failedinsurances/1.json
  def destroy
    @failedinsurance.destroy
    respond_to do |format|
      format.html { redirect_to failedinsurances_url, notice: 'Failedinsurance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_failedinsurance
      @failedinsurance = Failedinsurance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def failedinsurance_params
      params.require(:failedinsurance).permit(:code, :text)
    end
end

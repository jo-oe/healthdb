class SuccessfulinsurancesController < ApplicationController
  before_action :set_successfulinsurance, only: [:show, :edit, :update, :destroy]

  # GET /successfulinsurances
  # GET /successfulinsurances.json
  def index
    @successfulinsurances = Successfulinsurance.all
  end

  # GET /successfulinsurances/1
  # GET /successfulinsurances/1.json
  def show
  end

  # GET /successfulinsurances/new
  def new
    @successfulinsurance = Successfulinsurance.new
  end

  # GET /successfulinsurances/1/edit
  def edit
  end

  # POST /successfulinsurances
  # POST /successfulinsurances.json
  def create
    @successfulinsurance = Successfulinsurance.new(successfulinsurance_params)

    respond_to do |format|
      if @successfulinsurance.save
        format.html { redirect_to @successfulinsurance, notice: 'Successfulinsurance was successfully created.' }
        format.json { render :show, status: :created, location: @successfulinsurance }
      else
        format.html { render :new }
        format.json { render json: @successfulinsurance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /successfulinsurances/1
  # PATCH/PUT /successfulinsurances/1.json
  def update
    respond_to do |format|
      if @successfulinsurance.update(successfulinsurance_params)
        format.html { redirect_to @successfulinsurance, notice: 'Successfulinsurance was successfully updated.' }
        format.json { render :show, status: :ok, location: @successfulinsurance }
      else
        format.html { render :edit }
        format.json { render json: @successfulinsurance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /successfulinsurances/1
  # DELETE /successfulinsurances/1.json
  def destroy
    @successfulinsurance.destroy
    respond_to do |format|
      format.html { redirect_to successfulinsurances_url, notice: 'Successfulinsurance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_successfulinsurance
      @successfulinsurance = Successfulinsurance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def successfulinsurance_params
      params.require(:successfulinsurance).permit(:code, :text)
    end
end

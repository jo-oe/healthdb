class ReferralauthoritiesController < ApplicationController
  before_action :set_referralauthority, only: [:show, :edit, :update, :destroy]

  # GET /referralauthorities
  # GET /referralauthorities.json
  def index
    @referralauthorities = Referralauthority.all
  end

  # GET /referralauthorities/1
  # GET /referralauthorities/1.json
  def show
  end

  # GET /referralauthorities/new
  def new
    @referralauthority = Referralauthority.new
  end

  # GET /referralauthorities/1/edit
  def edit
  end

  # POST /referralauthorities
  # POST /referralauthorities.json
  def create
    @referralauthority = Referralauthority.new(referralauthority_params)

    respond_to do |format|
      if @referralauthority.save
        format.html { redirect_to @referralauthority, notice: 'Referralauthority was successfully created.' }
        format.json { render :show, status: :created, location: @referralauthority }
      else
        format.html { render :new }
        format.json { render json: @referralauthority.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referralauthorities/1
  # PATCH/PUT /referralauthorities/1.json
  def update
    respond_to do |format|
      if @referralauthority.update(referralauthority_params)
        format.html { redirect_to @referralauthority, notice: 'Referralauthority was successfully updated.' }
        format.json { render :show, status: :ok, location: @referralauthority }
      else
        format.html { render :edit }
        format.json { render json: @referralauthority.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referralauthorities/1
  # DELETE /referralauthorities/1.json
  def destroy
    @referralauthority.destroy
    respond_to do |format|
      format.html { redirect_to referralauthorities_url, notice: 'Referralauthority was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referralauthority
      @referralauthority = Referralauthority.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def referralauthority_params
      params.require(:referralauthority).permit(:code, :text)
    end
end

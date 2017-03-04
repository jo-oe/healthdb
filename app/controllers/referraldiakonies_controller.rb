class ReferraldiakoniesController < ApplicationController
  before_action :set_referraldiakony, only: [:show, :edit, :update, :destroy]

  # GET /referraldiakonies
  # GET /referraldiakonies.json
  def index
    @referraldiakonies = Referraldiakonie.all
  end

  # GET /referraldiakonies/1
  # GET /referraldiakonies/1.json
  def show
  end

  # GET /referraldiakonies/new
  def new
    @referraldiakony = Referraldiakonie.new
  end

  # GET /referraldiakonies/1/edit
  def edit
  end

  # POST /referraldiakonies
  # POST /referraldiakonies.json
  def create
    @referraldiakony = Referraldiakonie.new(referraldiakony_params)

    respond_to do |format|
      if @referraldiakony.save
        format.html { redirect_to @referraldiakony, notice: 'Referraldiakonie was successfully created.' }
        format.json { render :show, status: :created, location: @referraldiakony }
      else
        format.html { render :new }
        format.json { render json: @referraldiakony.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referraldiakonies/1
  # PATCH/PUT /referraldiakonies/1.json
  def update
    respond_to do |format|
      if @referraldiakony.update(referraldiakony_params)
        format.html { redirect_to @referraldiakony, notice: 'Referraldiakonie was successfully updated.' }
        format.json { render :show, status: :ok, location: @referraldiakony }
      else
        format.html { render :edit }
        format.json { render json: @referraldiakony.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referraldiakonies/1
  # DELETE /referraldiakonies/1.json
  def destroy
    @referraldiakony.destroy
    respond_to do |format|
      format.html { redirect_to referraldiakonies_url, notice: 'Referraldiakonie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referraldiakony
      @referraldiakony = Referraldiakonie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def referraldiakony_params
      params.require(:referraldiakony).permit(:code, :text)
    end
end

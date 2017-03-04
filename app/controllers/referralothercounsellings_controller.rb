class ReferralothercounsellingsController < ApplicationController
  before_action :set_referralothercounselling, only: [:show, :edit, :update, :destroy]

  # GET /referralothercounsellings
  # GET /referralothercounsellings.json
  def index
    @referralothercounsellings = Referralothercounselling.all
  end

  # GET /referralothercounsellings/1
  # GET /referralothercounsellings/1.json
  def show
  end

  # GET /referralothercounsellings/new
  def new
    @referralothercounselling = Referralothercounselling.new
  end

  # GET /referralothercounsellings/1/edit
  def edit
  end

  # POST /referralothercounsellings
  # POST /referralothercounsellings.json
  def create
    @referralothercounselling = Referralothercounselling.new(referralothercounselling_params)

    respond_to do |format|
      if @referralothercounselling.save
        format.html { redirect_to @referralothercounselling, notice: 'Referralothercounselling was successfully created.' }
        format.json { render :show, status: :created, location: @referralothercounselling }
      else
        format.html { render :new }
        format.json { render json: @referralothercounselling.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referralothercounsellings/1
  # PATCH/PUT /referralothercounsellings/1.json
  def update
    respond_to do |format|
      if @referralothercounselling.update(referralothercounselling_params)
        format.html { redirect_to @referralothercounselling, notice: 'Referralothercounselling was successfully updated.' }
        format.json { render :show, status: :ok, location: @referralothercounselling }
      else
        format.html { render :edit }
        format.json { render json: @referralothercounselling.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referralothercounsellings/1
  # DELETE /referralothercounsellings/1.json
  def destroy
    @referralothercounselling.destroy
    respond_to do |format|
      format.html { redirect_to referralothercounsellings_url, notice: 'Referralothercounselling was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referralothercounselling
      @referralothercounselling = Referralothercounselling.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def referralothercounselling_params
      params.require(:referralothercounselling).permit(:code, :text)
    end
end

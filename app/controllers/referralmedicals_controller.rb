class ReferralmedicalsController < ApplicationController
  before_action :set_referralmedical, only: [:show, :edit, :update, :destroy]

  # GET /referralmedicals
  # GET /referralmedicals.json
  def index
    @referralmedicals = Referralmedical.all
  end

  # GET /referralmedicals/1
  # GET /referralmedicals/1.json
  def show
  end

  # GET /referralmedicals/new
  def new
    @referralmedical = Referralmedical.new
  end

  # GET /referralmedicals/1/edit
  def edit
  end

  # POST /referralmedicals
  # POST /referralmedicals.json
  def create
    @referralmedical = Referralmedical.new(referralmedical_params)

    respond_to do |format|
      if @referralmedical.save
        format.html { redirect_to @referralmedical, notice: 'Referralmedical was successfully created.' }
        format.json { render :show, status: :created, location: @referralmedical }
      else
        format.html { render :new }
        format.json { render json: @referralmedical.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referralmedicals/1
  # PATCH/PUT /referralmedicals/1.json
  def update
    respond_to do |format|
      if @referralmedical.update(referralmedical_params)
        format.html { redirect_to @referralmedical, notice: 'Referralmedical was successfully updated.' }
        format.json { render :show, status: :ok, location: @referralmedical }
      else
        format.html { render :edit }
        format.json { render json: @referralmedical.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referralmedicals/1
  # DELETE /referralmedicals/1.json
  def destroy
    @referralmedical.destroy
    respond_to do |format|
      format.html { redirect_to referralmedicals_url, notice: 'Referralmedical was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referralmedical
      @referralmedical = Referralmedical.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def referralmedical_params
      params.require(:referralmedical).permit(:code, :text)
    end
end

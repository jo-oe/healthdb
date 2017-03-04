class ReferralcaritasController < ApplicationController
  before_action :set_referralcarita, only: [:show, :edit, :update, :destroy]

  # GET /referralcaritas
  # GET /referralcaritas.json
  def index
    @referralcaritas = Referralcaritas.all
  end

  # GET /referralcaritas/1
  # GET /referralcaritas/1.json
  def show
  end

  # GET /referralcaritas/new
  def new
    @referralcarita = Referralcaritas.new
  end

  # GET /referralcaritas/1/edit
  def edit
  end

  # POST /referralcaritas
  # POST /referralcaritas.json
  def create
    @referralcarita = Referralcaritas.new(referralcarita_params)

    respond_to do |format|
      if @referralcarita.save
        format.html { redirect_to @referralcarita, notice: 'Referralcaritas was successfully created.' }
        format.json { render :show, status: :created, location: @referralcarita }
      else
        format.html { render :new }
        format.json { render json: @referralcarita.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referralcaritas/1
  # PATCH/PUT /referralcaritas/1.json
  def update
    respond_to do |format|
      if @referralcarita.update(referralcarita_params)
        format.html { redirect_to @referralcarita, notice: 'Referralcaritas was successfully updated.' }
        format.json { render :show, status: :ok, location: @referralcarita }
      else
        format.html { render :edit }
        format.json { render json: @referralcarita.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referralcaritas/1
  # DELETE /referralcaritas/1.json
  def destroy
    @referralcarita.destroy
    respond_to do |format|
      format.html { redirect_to referralcaritas_index_url, notice: 'Referralcaritas was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referralcarita
      @referralcarita = Referralcaritas.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def referralcarita_params
      params.require(:referralcarita).permit(:code, :text)
    end
end

class LegalstatusesController < ApplicationController
  before_action :set_legalstatus, only: [:show, :edit, :update, :destroy]

  # GET /legalstatuses
  # GET /legalstatuses.json
  def index
    @legalstatuses = Legalstatus.all
  end

  # GET /legalstatuses/1
  # GET /legalstatuses/1.json
  def show
  end

  # GET /legalstatuses/new
  def new
    @legalstatus = Legalstatus.new
  end

  # GET /legalstatuses/1/edit
  def edit
  end

  # POST /legalstatuses
  # POST /legalstatuses.json
  def create
    @legalstatus = Legalstatus.new(legalstatus_params)

    respond_to do |format|
      if @legalstatus.save
        format.html { redirect_to @legalstatus, notice: 'Legalstatus was successfully created.' }
        format.json { render :show, status: :created, location: @legalstatus }
      else
        format.html { render :new }
        format.json { render json: @legalstatus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /legalstatuses/1
  # PATCH/PUT /legalstatuses/1.json
  def update
    respond_to do |format|
      if @legalstatus.update(legalstatus_params)
        format.html { redirect_to @legalstatus, notice: 'Legalstatus was successfully updated.' }
        format.json { render :show, status: :ok, location: @legalstatus }
      else
        format.html { render :edit }
        format.json { render json: @legalstatus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /legalstatuses/1
  # DELETE /legalstatuses/1.json
  def destroy
    @legalstatus.destroy
    respond_to do |format|
      format.html { redirect_to legalstatuses_url, notice: 'Legalstatus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_legalstatus
      @legalstatus = Legalstatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def legalstatus_params
      params.require(:legalstatus).permit(:code, :text)
    end
end

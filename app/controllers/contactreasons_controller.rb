class ContactreasonsController < ApplicationController
  before_action :set_contactreason, only: [:show, :edit, :update, :destroy]

  # GET /contactreasons
  # GET /contactreasons.json
  def index
    @contactreasons = Contactreason.all
  end

  # GET /contactreasons/1
  # GET /contactreasons/1.json
  def show
  end

  # GET /contactreasons/new
  def new
    @contactreason = Contactreason.new
  end

  # GET /contactreasons/1/edit
  def edit
  end

  # POST /contactreasons
  # POST /contactreasons.json
  def create
    @contactreason = Contactreason.new(contactreason_params)

    respond_to do |format|
      if @contactreason.save
        format.html { redirect_to @contactreason, notice: 'Contactreason was successfully created.' }
        format.json { render :show, status: :created, location: @contactreason }
      else
        format.html { render :new }
        format.json { render json: @contactreason.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contactreasons/1
  # PATCH/PUT /contactreasons/1.json
  def update
    respond_to do |format|
      if @contactreason.update(contactreason_params)
        format.html { redirect_to @contactreason, notice: 'Contactreason was successfully updated.' }
        format.json { render :show, status: :ok, location: @contactreason }
      else
        format.html { render :edit }
        format.json { render json: @contactreason.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contactreasons/1
  # DELETE /contactreasons/1.json
  def destroy
    @contactreason.destroy
    respond_to do |format|
      format.html { redirect_to contactreasons_url, notice: 'Contactreason was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contactreason
      @contactreason = Contactreason.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contactreason_params
      params.require(:contactreason).permit(:code, :text)
    end
end

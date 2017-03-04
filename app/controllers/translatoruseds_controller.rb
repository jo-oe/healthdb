class TranslatorusedsController < ApplicationController
  before_action :set_translatorused, only: [:show, :edit, :update, :destroy]

  # GET /translatoruseds
  # GET /translatoruseds.json
  def index
    @translatoruseds = Translatorused.all
  end

  # GET /translatoruseds/1
  # GET /translatoruseds/1.json
  def show
  end

  # GET /translatoruseds/new
  def new
    @translatorused = Translatorused.new
  end

  # GET /translatoruseds/1/edit
  def edit
  end

  # POST /translatoruseds
  # POST /translatoruseds.json
  def create
    @translatorused = Translatorused.new(translatorused_params)

    respond_to do |format|
      if @translatorused.save
        format.html { redirect_to @translatorused, notice: 'Translatorused was successfully created.' }
        format.json { render :show, status: :created, location: @translatorused }
      else
        format.html { render :new }
        format.json { render json: @translatorused.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /translatoruseds/1
  # PATCH/PUT /translatoruseds/1.json
  def update
    respond_to do |format|
      if @translatorused.update(translatorused_params)
        format.html { redirect_to @translatorused, notice: 'Translatorused was successfully updated.' }
        format.json { render :show, status: :ok, location: @translatorused }
      else
        format.html { render :edit }
        format.json { render json: @translatorused.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /translatoruseds/1
  # DELETE /translatoruseds/1.json
  def destroy
    @translatorused.destroy
    respond_to do |format|
      format.html { redirect_to translatoruseds_url, notice: 'Translatorused was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_translatorused
      @translatorused = Translatorused.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def translatorused_params
      params.require(:translatorused).permit(:code, :text)
    end
end

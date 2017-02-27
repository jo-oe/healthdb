class CitizenshipsController < ApplicationController
  before_action :set_citizenship, only: [:show, :edit, :update, :destroy]


  def autocomplete
    render json: Citizenship.search(params[:query], match: :word_start, limit: 10).map do |citizenship|
      { name: citizenship.name, iso3166: citizenship.iso3166 }
    end
  end

  # GET /citizenships
  # GET /citizenships.json
  def index
    if params[:query].present?
      @citizenships = Citizenship.search(params[:query])
    else
      @citizenships = Citizenship.all
    end
  end

  # GET /citizenships/1
  # GET /citizenships/1.json
  def show
  end

  # GET /citizenships/new
  def new
    @citizenship = Citizenship.new
  end

  # GET /citizenships/1/edit
  def edit
  end

  # POST /citizenships
  # POST /citizenships.json
  def create
    @citizenship = Citizenship.new(citizenship_params)

    respond_to do |format|
      if @citizenship.save
        format.html { redirect_to @citizenship, notice: 'Citizenship was successfully created.' }
        format.json { render :show, status: :created, location: @citizenship }
      else
        format.html { render :new }
        format.json { render json: @citizenship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /citizenships/1
  # PATCH/PUT /citizenships/1.json
  def update
    respond_to do |format|
      if @citizenship.update(citizenship_params)
        format.html { redirect_to @citizenship, notice: 'Citizenship was successfully updated.' }
        format.json { render :show, status: :ok, location: @citizenship }
      else
        format.html { render :edit }
        format.json { render json: @citizenship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /citizenships/1
  # DELETE /citizenships/1.json
  def destroy
    @citizenship.destroy
    respond_to do |format|
      format.html { redirect_to citizenships_url, notice: 'Citizenship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_citizenship
      @citizenship = Citizenship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def citizenship_params
      params.require(:citizenship).permit(:iso3166, :name)
    end
end

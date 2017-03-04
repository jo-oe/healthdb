class CounselledpersonsController < ApplicationController
  before_action :set_counselledperson, only: [:show, :edit, :update, :destroy]

  # GET /counselledpersons
  # GET /counselledpersons.json
  def index
    @counselledpersons = Counselledpersons.all
  end

  # GET /counselledpersons/1
  # GET /counselledpersons/1.json
  def show
  end

  # GET /counselledpersons/new
  def new
    @counselledperson = Counselledpersons.new
  end

  # GET /counselledpersons/1/edit
  def edit
  end

  # POST /counselledpersons
  # POST /counselledpersons.json
  def create
    @counselledperson = Counselledpersons.new(counselledperson_params)

    respond_to do |format|
      if @counselledperson.save
        format.html { redirect_to @counselledperson, notice: 'Counselledpersons was successfully created.' }
        format.json { render :show, status: :created, location: @counselledperson }
      else
        format.html { render :new }
        format.json { render json: @counselledperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /counselledpersons/1
  # PATCH/PUT /counselledpersons/1.json
  def update
    respond_to do |format|
      if @counselledperson.update(counselledperson_params)
        format.html { redirect_to @counselledperson, notice: 'Counselledpersons was successfully updated.' }
        format.json { render :show, status: :ok, location: @counselledperson }
      else
        format.html { render :edit }
        format.json { render json: @counselledperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /counselledpersons/1
  # DELETE /counselledpersons/1.json
  def destroy
    @counselledperson.destroy
    respond_to do |format|
      format.html { redirect_to counselledpersons_index_url, notice: 'Counselledpersons was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_counselledperson
      @counselledperson = Counselledpersons.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def counselledperson_params
      params.require(:counselledperson).permit(:code, :text)
    end
end

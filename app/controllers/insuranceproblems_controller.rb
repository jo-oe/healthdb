class InsuranceproblemsController < ApplicationController
  before_action :set_insuranceproblem, only: [:show, :edit, :update, :destroy]

  # GET /insuranceproblems
  # GET /insuranceproblems.json
  def index
    @insuranceproblems = Insuranceproblem.all
  end

  # GET /insuranceproblems/1
  # GET /insuranceproblems/1.json
  def show
  end

  # GET /insuranceproblems/new
  def new
    @insuranceproblem = Insuranceproblem.new
  end

  # GET /insuranceproblems/1/edit
  def edit
  end

  # POST /insuranceproblems
  # POST /insuranceproblems.json
  def create
    @insuranceproblem = Insuranceproblem.new(insuranceproblem_params)

    respond_to do |format|
      if @insuranceproblem.save
        format.html { redirect_to @insuranceproblem, notice: 'Insuranceproblem was successfully created.' }
        format.json { render :show, status: :created, location: @insuranceproblem }
      else
        format.html { render :new }
        format.json { render json: @insuranceproblem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insuranceproblems/1
  # PATCH/PUT /insuranceproblems/1.json
  def update
    respond_to do |format|
      if @insuranceproblem.update(insuranceproblem_params)
        format.html { redirect_to @insuranceproblem, notice: 'Insuranceproblem was successfully updated.' }
        format.json { render :show, status: :ok, location: @insuranceproblem }
      else
        format.html { render :edit }
        format.json { render json: @insuranceproblem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insuranceproblems/1
  # DELETE /insuranceproblems/1.json
  def destroy
    @insuranceproblem.destroy
    respond_to do |format|
      format.html { redirect_to insuranceproblems_url, notice: 'Insuranceproblem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insuranceproblem
      @insuranceproblem = Insuranceproblem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def insuranceproblem_params
      params.require(:insuranceproblem).permit(:code, :text)
    end
end

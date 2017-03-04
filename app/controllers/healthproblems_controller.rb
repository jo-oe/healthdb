class HealthproblemsController < ApplicationController
  before_action :set_healthproblem, only: [:show, :edit, :update, :destroy]

  # GET /healthproblems
  # GET /healthproblems.json
  def index
    @healthproblems = Healthproblem.all
  end

  # GET /healthproblems/1
  # GET /healthproblems/1.json
  def show
  end

  # GET /healthproblems/new
  def new
    @healthproblem = Healthproblem.new
  end

  # GET /healthproblems/1/edit
  def edit
  end

  # POST /healthproblems
  # POST /healthproblems.json
  def create
    @healthproblem = Healthproblem.new(healthproblem_params)

    respond_to do |format|
      if @healthproblem.save
        format.html { redirect_to @healthproblem, notice: 'Healthproblem was successfully created.' }
        format.json { render :show, status: :created, location: @healthproblem }
      else
        format.html { render :new }
        format.json { render json: @healthproblem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /healthproblems/1
  # PATCH/PUT /healthproblems/1.json
  def update
    respond_to do |format|
      if @healthproblem.update(healthproblem_params)
        format.html { redirect_to @healthproblem, notice: 'Healthproblem was successfully updated.' }
        format.json { render :show, status: :ok, location: @healthproblem }
      else
        format.html { render :edit }
        format.json { render json: @healthproblem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /healthproblems/1
  # DELETE /healthproblems/1.json
  def destroy
    @healthproblem.destroy
    respond_to do |format|
      format.html { redirect_to healthproblems_url, notice: 'Healthproblem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_healthproblem
      @healthproblem = Healthproblem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def healthproblem_params
      params.require(:healthproblem).permit(:code, :text)
    end
end

class ContactsController < ApplicationController
  before_filter :authorize
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    if params[:client_id]
      @contacts = Contact.where("client_id = ?", params[:client_id])
    else
      @contacts = Contact.all
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    @contact.client_id = params[:client_id]
    @contact.counsellor_id = session[:user_id]
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to contacts_path(@contact.client_id), notice: t(:contact_successfully_created) }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to contacts_path(@contact.client_id), notice: t(:contact_successfully_updated) }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_path(@contact.client_id), notice: t(:contact_successfully_destroyed) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:client_id, :contactdate, :counsellor_id, :contactreason_id, :contactreasonfreetext, :insurancestatus_id, :counselledperson_id, :translatorused_id, :has_insuranceproblem, :has_paymentproblem, :has_legalproblem, :has_housingproblem, :has_workproblem, :has_psychosocialproblem, :has_healthproblem, :insuranceproblem_id, :healthproblem_id, :referral_id, :referralcaritas_id, :referraldiakonie_id, :referralothercounselling_id, :referralmedical_id, :referralauthority_id, :successfulinsurance_id, :failedinsurance_id, :comment)
    end
end
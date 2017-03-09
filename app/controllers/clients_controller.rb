class ClientsController < ApplicationController
  before_filter :authorize
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    if(params['filter']=="yes")
      @clients = Client.where(nil)
      Client.new.attributes.each do |attr_name, attr_value|
        if (attr_name == "birthdate")
          if (params['birthdate_selectrange'] == "true" )
            @birthdate_rangestart = params['birthdate_rangestart'].to_date
            @birthdate_rangeend = params['birthdate_rangeend'].to_date
            p "start: " + @birthdate_rangestart.to_s + ", end: " + @birthdate_rangeend.to_s
            @clients = @clients.where("birthdate >= ? and birthdate <= ?", @birthdate_rangestart, @birthdate_rangeend)
          end
        elsif (attr_name == "datefirstcontact")
          if (params['datefirstcontact_selectrange'] == "true" )
            @datefirstcontact_rangestart = params['datefirstcontact_rangestart'].to_date
            @datefirstcontact_rangeend = params['datefirstcontact_rangeend'].to_date

            @clients = @clients.where("datefirstcontact >= ? and datefirstcontact <= ?", @datefirstcontact_rangestart, @datefirstcontact_rangeend)
          end

        elsif (params[attr_name] && params[attr_name].length > 0)
          @param = params[attr_name]
          @clients = @clients.where("#{attr_name} like ?", "%"+@param+"%") if params[attr_name].present?
        end
      end
    else
      @clients = Client.all
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
    @codefixed = Date.today.strftime("%y") + User.find_by_id(session[:user_id]).signature
    @client.id = @codefixed+"0000"
    (1..9999).each do |i|
      @thiscode = @codefixed+i.to_s.rjust(4, '0')
      p @thiscode
      if(!Client.find_by_id(@thiscode))
        @client.id = @thiscode
        break
      end
    end
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
    respond_to do |format|
      if @client.save
        format.html { redirect_to new_contact_url(:client_id =>  @client.id), notice: t(:client_successfully_created) }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to new_contact_url(:client_id =>  @client.id), notice: t(:client_successfully_updated) }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: t(:client_successfully_updated) }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def client_params
    params.require(:client).permit(:id, :lastname, :firstname, :birthdate, :sex_id, :homeplace_id, :citizenship_id, :legalstatus_id, :familystatus_id, :childrencount, :datefirstcontact, :referrer_id, :referrerfreetext)
  end
end

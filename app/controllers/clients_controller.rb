class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]


  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
    @clients = Client.all
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
    @client.user_id = current_user.id
    respond_to do |format|
      if @client.save
        if current_user.role == "Gerencia"
          format.js {render layout: false}
          format.html { redirect_to @client, notice: 'Client was successfully created.' }
        elsif current_user.role == "Paciente"
          format.html { redirect_to @client, notice: 'Client was successfully created.' }
          format.json { render :show, status: :created, location: @client }
        elsif current_user.role == "Profesional"
          format.html { redirect_to :collaborators, notice: 'Client was successfully created.' }
          format.json { render :show, status: :created, location: @collaborators }
        end
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
        if current_user.role == "Gerencia"
          format.html { redirect_to :admins, notice: 'Client was successfully updated.' }
          format.json { render :show, status: :ok, location: @client }
        else
          format.html { redirect_to @client, notice: 'Client was successfully updated.' }
          format.json { render :show, status: :ok, location: @client }
        end
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
      if current_user.role = "Gerencia"
        format.html { redirect_to :admins, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { redirect_to :clients, notice: 'Client was successfully destroyed.' }
        format.json { render :show, status: :ok, location: @client }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name, :phone_number, :rut, :paid_out, :user_id, :collaborator_id)
    end


end

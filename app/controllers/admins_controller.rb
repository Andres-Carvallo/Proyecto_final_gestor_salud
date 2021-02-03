class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_action :verify_role
  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all
    @clients = Client.where(:created_at => Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)
    @clients_last_month = Client.where(:created_at => Time.zone.now.last_month.beginning_of_month..Time.zone.now.last_month.end_of_month)
    @collaborator = Collaborator.new
    @client = Client.new
    @service = Service.new
    @week_service_chart = Service.where(:created_at => Time.zone.now.beginning_of_month..Time.zone.now.end_of_month).group_by_day_of_week(:created_at, format: "%a").count
    @week_collab_chart = Collaborator.where(:created_at => Time.zone.now.beginning_of_month..Time.zone.now.end_of_month).group_by_day_of_week(:created_at, format: "%a").count
    @services = Service.where(:created_at => Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)
    @services_last_month = Service.where(:created_at => Time.zone.now.last_month.beginning_of_month..Time.zone.now.last_month.end_of_month)
    @collaborators_last_month = []
    @collaborators = []
    if @services != nil
      @services.each do |service|
        @collaborators.push(service.client.collaborator)
      end
    end
    
    if @services_last_month != nil
      @services_last_month.each do |service|
        @collaborators_last_month.push(service.client.collaborator)
      end
    end

    
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)
    @admin.user_id = current_user.id
    respond_to do |format|
      if @admin.save
        format.html { redirect_to :admins, notice: 'Admin was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to :admins, notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_params
      params.require(:admin).permit(:name)
    end

    def verify_role
      if current_user.role != "Gerencia"
        redirect_to user_session_path
      end
    end
end

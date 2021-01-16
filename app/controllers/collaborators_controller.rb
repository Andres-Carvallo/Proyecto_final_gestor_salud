class CollaboratorsController < ApplicationController
  before_action :set_collaborator, only: [:show, :edit, :update, :destroy]
  before_action :verify_role
  # GET /collaborators
  # GET /collaborators.json
  def index
    @collaborators = Collaborator.all
    @current_collaborator = Collaborator.where(user_id: current_user.id).first.clients
  end

  # GET /collaborators/1
  # GET /collaborators/1.json
  def show
  end

  # GET /collaborators/new
  def new
    @collaborator = Collaborator.new
  end

  # GET /collaborators/1/edit
  def edit
  end

  # POST /collaborators
  # POST /collaborators.json
  def create
    @collaborator = Collaborator.new(collaborator_params)
    @collaborator.user_id = current_user.id
    respond_to do |format|
      if @collaborator.save
        if current_user.role = "Gerencia"
          format.js {render layout: false}
        else
          format.html { redirect_to :collaborators, notice: 'Collaborator was successfully created.' }
          format.json { render :show, status: :created, location: @collaborator }
        end
      else
        format.html { render :new }
        format.json { render json: @collaborator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collaborators/1
  # PATCH/PUT /collaborators/1.json
  def update
    respond_to do |format|
      if @collaborator.update(collaborator_params)
        if current_user.role = "Gerencia"
          format.html { redirect_to :admins, notice: 'Collaborator was successfully updated.' }
          format.json { render :show, status: :ok, location: @collaborator }
        else
          format.html { redirect_to :collaborators, notice: 'Collaborator was successfully updated.' }
          format.json { render :show, status: :ok, location: @collaborator }
        end
      else
        format.html { render :edit }
        format.json { render json: @collaborator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collaborators/1
  # DELETE /collaborators/1.json
  def destroy
    @collaborator.destroy
    respond_to do |format|
      format.html { redirect_to collaborators_url, notice: 'Collaborator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collaborator
      @collaborator = Collaborator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collaborator_params
      params.require(:collaborator).permit(:name, :email, :phone_number, :percentage_profit, :profit_amount, :admin_id)
    end

    def verify_role
      if current_user.role == "Paciente"
        redirect_to user_session_path
      end
    end
end

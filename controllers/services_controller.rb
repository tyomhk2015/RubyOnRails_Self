class ServicesController < ApplicationController
  # before_action : Do something before excecuting codes after the current line.
  before_action :set_service, only: %i[ show edit update destroy ]
  # If the user is not logged in, do not let them do anything except /index and /show.
  before_action :authenticate_user!, except: [:index, :show]
  # Only validated user is eligible for the following actions, 'edit', 'update', and 'destory'.
  before_action :validate_user, only: [:edit, :update, :destroy]

  # GET /services or /services.json
  def index
    @services = Service.all
  end

  # GET /services/1 or /services/1.json
  def show
  end

  # GET /services/new
  def new
    # @service = Service.new
    # Let the rails to utilize the current user's service data
    @service = current_user.services.build
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services or /services.json
  def create
    # @service = Service.new(service_params)
    # Let the rails to utilize the current user's service data
    @service = current_user.services.build(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: "Service was successfully created." }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1 or /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: "Service was successfully updated." }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1 or /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: "Service was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def validate_user
    @service = current_user.services.find_by(id: params[:id])
    redirect_to services_path, notice: "◆◆ Not authorized user ◆◆" if @service.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_params # This is where data from the form field can be recieved.
      params.require(:service).permit(:name, :type, :email, :phone, :twitter, :user_id)
    end
end

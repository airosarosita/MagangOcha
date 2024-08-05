class Client::DashboardsController < ApplicationController
  before_action :set_client_dashboard, only: %i[ show edit update destroy ]

  # GET /client/dashboards or /client/dashboards.json
  def index
    @client_dashboards = Client::Dashboard.all
  end

  # GET /client/dashboards/1 or /client/dashboards/1.json
  def show
  end

  # GET /client/dashboards/new
  def new
    @client_dashboard = Client::Dashboard.new
  end

  # GET /client/dashboards/1/edit
  def edit
  end

  # POST /client/dashboards or /client/dashboards.json
  def create
    @client_dashboard = Client::Dashboard.new(client_dashboard_params)

    respond_to do |format|
      if @client_dashboard.save
        format.html { redirect_to client_dashboard_url(@client_dashboard), notice: "Dashboard was successfully created." }
        format.json { render :show, status: :created, location: @client_dashboard }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client_dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client/dashboards/1 or /client/dashboards/1.json
  def update
    respond_to do |format|
      if @client_dashboard.update(client_dashboard_params)
        format.html { redirect_to client_dashboard_url(@client_dashboard), notice: "Dashboard was successfully updated." }
        format.json { render :show, status: :ok, location: @client_dashboard }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client_dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client/dashboards/1 or /client/dashboards/1.json
  def destroy
    @client_dashboard.destroy!

    respond_to do |format|
      format.html { redirect_to client_dashboards_url, notice: "Dashboard was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_dashboard
      @client_dashboard = Client::Dashboard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_dashboard_params
      params.fetch(:client_dashboard, {})
    end
end

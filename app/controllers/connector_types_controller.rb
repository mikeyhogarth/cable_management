class ConnectorTypesController < ApplicationController
  before_action :set_connector_type, only: [:show, :edit, :update, :destroy]

  # GET /connector_types
  # GET /connector_types.json
  def index
    @connector_types = ConnectorType.all
  end

  # GET /connector_types/1
  # GET /connector_types/1.json
  def show
  end

  # GET /connector_types/new
  def new
    @connector_type = ConnectorType.new
  end

  # GET /connector_types/1/edit
  def edit
  end

  # POST /connector_types
  # POST /connector_types.json
  def create
    @connector_type = ConnectorType.new(connector_type_params)

    respond_to do |format|
      if @connector_type.save
        format.html { redirect_to @connector_type, notice: 'Connector type was successfully created.' }
        format.json { render :show, status: :created, location: @connector_type }
      else
        format.html { render :new }
        format.json { render json: @connector_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /connector_types/1
  # PATCH/PUT /connector_types/1.json
  def update
    respond_to do |format|
      if @connector_type.update(connector_type_params)
        format.html { redirect_to @connector_type, notice: 'Connector type was successfully updated.' }
        format.json { render :show, status: :ok, location: @connector_type }
      else
        format.html { render :edit }
        format.json { render json: @connector_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /connector_types/1
  # DELETE /connector_types/1.json
  def destroy
    @connector_type.destroy
    respond_to do |format|
      format.html { redirect_to connector_types_url, notice: 'Connector type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_connector_type
      @connector_type = ConnectorType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def connector_type_params
      params.require(:connector_type).permit(:name)
    end
end

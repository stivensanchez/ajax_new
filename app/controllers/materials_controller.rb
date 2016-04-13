class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :edit, :update, :destroy]
  before_action :set_house
  # GET /materials
  # GET /materials.json
  def index
    @materials = @house.materials.all
  end

  # GET /materials/1
  # GET /materials/1.json
  def show
  end

  # GET /materials/new
  def new
    @material = Material.new
    respond_to { |format| format.js}
  end

  # GET /materials/1/edit
  def edit
    respond_to { |format| format.js}
  end

  # POST /materials
  # POST /materials.json
  def create
    @material = Material.new(material_params)
    @material.house_id = @house.id
    respond_to do |format|
      if @material.save
        format.js
      else
        format.js {render :new}
      end
    end
  end

  # PATCH/PUT /materials/1
  # PATCH/PUT /materials/1.json
  def update
    respond_to do |format|
      if @material.update(material_params)
        format.js
      else
        format.js {render :edit}
      end
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.json
  def destroy
    @material.destroy
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.find(params[:id]) if params[:id]
    end
    
    def set_house
      @house = House.find(params[:house_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def material_params
      params.require(:material).permit(:name, :description, :house_id)
    end
end

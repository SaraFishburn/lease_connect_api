class MaintenancesController < ApplicationController
  before_action :set_maintenance, except: %i[index create]

  def index
    render json: Maintenance.all.to_json
  end

  def show
    render json: {
      maintenance: @maintenance.to_json,
      house: @maintenance.house_id.to_json
    }
  end

  def create
    render json: Maintenance.create(maintenance_params)
  end

  def update
    @maintenance.update(maintenance_params)
  end

  def destroy
    @maintenance.destroy
  end

  private

  def set_maintenance
    @maintenance = Maintenance.find(params[:id])
  end

  def maintenance_params
    params.permit(:title, :description, :image_url)
  end
end

class MaintenancesController < ApplicationController
  before_action :set_maintenance, except: %i[index create]

  # method to render maintenance requests associated with the users account and role
  def index
    if current_user.role_name == 'tenant'
      render json: Maintenance.where(house_id: current_user.house_id).to_json
    else
      render json: Maintenance.to_json
    end
  end

  def create
    render json: Maintenance.create(**maintenance_params, house: current_user.house)
  end

  def update
    authorized('property manager', 'admin')
    @maintenance.update(maintenance_params)
  end

  private

  def set_maintenance
    @maintenance = Maintenance.find(params[:id])
  end

  def maintenance_params
    params.require(:maintenance).permit(:title, :description, :image_url)
  end
end
class MaintenancesController < ApplicationController
  before_action :set_maintenance, except: %i[index create]

  # method to render maintenance requests associated with the users account and role
  def index
    if current_user.role_name == 'tenant'
      render json: current_user.house.maintenances.as_json
    else
      render json: House.find(params[:house_id]).maintenances.as_json
    end
  end

  def create
    authorized("tenant")
    render json: Maintenance.create(**maintenance_params, house: current_user.house)
  end

  def update
    authorized('property manager', 'admin')

    @maintenance.update(status: params[:status])
  end

  private

  def set_maintenance
    @maintenance = Maintenance.find(params[:id])
  end

  def maintenance_params
    params.require(:maintenance).permit(:title, :description, :image_url)
  end
end
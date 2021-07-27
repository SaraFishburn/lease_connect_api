class HousesController < ApplicationController
  before_action :set_house, except: %i[index create]

  def index
    render json: House.all.to_json
  end

  def show
    render json: {
      property: @house.as_json,
      tenants: @house.tenants.as_json(except: [:password_digest])
    }
  end

  def create
    render json: House.create(house_params)
  end

  def update
    new_house_users = User.where(id: params[:tenants])

    users_to_remove = @house.tenants - new_house_users

    User.destroy(users_to_remove.pluck(:id))

    @house.tenants << new_house_users

    @house.assign_attributes(house_params)
    @house.save
  end

  def destroy
    @house.destroy
  end

  private

  def set_house
    @house = House.find(params[:id])
  end

  def house_params
    params.permit(:address, :title, :image_url)
  end
end

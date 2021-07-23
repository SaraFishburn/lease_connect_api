class HousesController < ApplicationController
  before_action :set_house, except: %i[index create]

  def index
    render json: House.all.to_json
  end

  def show
    render json: {
      property: @house.to_json,
      tenants: @house.tenants.to_json(except: [:password_digest])
    }
  end

  def create
    render json: House.create(house_params)
  end

  def update
    @house.update(house_params)
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

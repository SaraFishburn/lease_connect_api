class HousesController < ApplicationController
  before_action :set_house, except: %i[index create]

  # method to provide all houses in db
  def index
    # all houses only available to property managers and admin
    authorize('property manager', 'admin')
    render json: House.all.to_json
  end

  # method to provide details of a specific house
  def show
    # only property managers and admin should be able to perform this action
    authorized('property manager', 'admin')
    render json: {
      property: @house.as_json,
      tenants: @house.tenants.as_json(except: [:password_digest])
    }
  end

  # method to create a house record in the db
  def create
    # only property managers and admin should be able to perform this action
    authorized('property manager', 'admin')
    render json: House.create(house_params)
  end

  # method to update house details
  def update
    # only property managers and admin should be able to perform this action
    authorized('property manager', 'admin')

    # create an array with the updated tenants list passed from the front end
    new_house_users = User.where(id: params[:tenants])

    # add any users that are not in the updated tenants list to an array of users to remove
    users_to_remove = @house.tenants - new_house_users

    # delete the users no longer connected to the house
    # this deletes the user from the db (intentional) to prevent orphaned users
    User.destroy(users_to_remove.pluck(:id))

    # update the house record to include the updated tenants
    @house.tenants << new_house_users

    # assign the new attributes passed from the front end and save the house record
    @house.assign_attributes(house_params)
    @house.save
  end

  # method to remove house record from db
  def destroy
    # only property managers and admin should be able to perform this action
    authorized('property manager', 'admin')

    # if the house still has tenants attached, do not allow deletion
    unless @house.tenants.count.zero?
      return render json: { error: 'ERROR: tenants must be removed before deleting house' },
                    status: 401
    end

    @house.destroy
  end

  private

  # finds house based on id passed from the front end
  def set_house
    @house = House.find(params[:id])
  end

  def house_params
    params.permit(:address, :title, :image_url)
  end
end

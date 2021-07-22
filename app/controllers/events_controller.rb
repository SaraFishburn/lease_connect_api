class EventsController < ApplicationController
  def index
    events = houses.map(&:events)
    render json: events.to_json

  end

  def create; end

  def destroy; end

  private

  def houses
    role = current_user.role_name

    case role
    when 'tenant'
      [current_user.house]
    when 'property manager'
      current_user.properties
    end
  end
end

# find current user

# if current user has role 'tenant'
#   find the house
# else if current user has role 'property manager'
#   find the list of pinned houses

# iterate over found houses and retrieve all events asociated

# send events to front end

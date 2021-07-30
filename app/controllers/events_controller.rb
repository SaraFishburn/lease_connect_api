class EventsController < ApplicationController
  # method to provide events for the calendar page
  def index
    events = houses.reduce([]) do |acc, house|
      house_events = house.events.order(:datetime)
      # if the request is coming from a property manager or admin, attach the house to the event
      if ['property manager', 'admin'].include?(current_user.role_name)
        house_events = house_events.map do |event|
          { **event.as_json, house: house }
        end
      end
      acc + house_events
    end

    render json: events.to_json
  end

  # method to create an event record in db
  def create
    # only property managers and admin should be able to perform this action
    authorized('property manager', 'admin')
    Event.create(event_params)
  end

  private

  # method to set the houses for the index action
  def houses
    case current_user.role_name
    # only provide the tenants house to a tenant
    when 'tenant'
      [current_user.house]
    # return all houses if user is property manager or admin
    when 'property manager', 'admin'
      House.all
    end
  end

  def event_params
    params.require(:event).permit(:datetime, :event_type, :house_id)
  end
end

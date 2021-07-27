class EventsController < ApplicationController

  def index
    events = houses.reduce([]) do |acc, house|
      house_events = house.events.order(:datetime)
      if current_user.role_name == 'property manager'
        house_events = house_events.map do |event|
          { **event.as_json, house: house }
        end
      end
      acc + house_events
    end

    render json: events.to_json
  end

  def create
    Event.create(event_params)
  end

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

  def event_params
    params.require(:event).permit(:datetime, :event_type, :house_id)
  end
end

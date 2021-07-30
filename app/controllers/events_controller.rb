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
    authorized('property manager', 'admin')
    Event.create(event_params)
  end

  private

  def houses
    case current_user.role_name
    when 'tenant'
      [current_user.house]
    when 'property manager'
      House.all
    end
  end

  def event_params
    params.require(:event).permit(:datetime, :event_type, :house_id)
  end
end

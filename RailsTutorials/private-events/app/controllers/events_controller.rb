class EventsController < ApplicationController
  def index
    @events = Event.includes(:creator).all
  end

  def new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:success] = "Event #{@event.title} created!"
      redirect_to current_user
    else
      flash.now[:danger] = "Event not created: #{@event.errors.full_messages}"
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :title,
      :description,
      :date,
      :user_id
    )
  end
end

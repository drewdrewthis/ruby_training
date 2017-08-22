class EventsController < ApplicationController
  def index
    @events = Event.includes(:creator).all
  end

  def new
  end

  def show
    event
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

  def destroy
    title = event.title

    if event.destroy
      flash[:danger] = "Event #{title} deleted."
      redirect_to :back
    else
      flash.now[:danger] = "Event not deleted: #{event.errors.full_messages}"
      redirect_to :back
    end
  end

  def subscribe
    new_attendee = event.event_attendees.new(attendee_id: current_user.id)

    if new_attendee.save
      flash[:success] = "Great! See you there!"
      redirect_to :back
    else
      flash.now[:danger] = "Whoops! Something went wrong: #{event.errors.full_messages}"
      redirect_to :back
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

  def event
    Event.find(params[:id])
  end
end

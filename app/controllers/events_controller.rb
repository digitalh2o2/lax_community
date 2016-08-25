class EventsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_current_event, only: [:show]

	def index
		@events = Event.all
		authorize User
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.create(event_params)
		if @event.save
			redirect_to events_path
		else
			flash[:alert] = "Description too short!"
			redirect_to new_event_path
		end
	end

	def show

	end

	private

	def set_current_event
		@event = Event.find(params[:id])
	end

	def event_params
		params.require(:event).permit(:name, :description)
	end
end

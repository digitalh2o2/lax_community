class EventsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_current_event, only: [:edit, :update, :destroy]

	def index
		if !user_signed_in?
			flash[:alert] = "You must sign in to view the Events"
			redirect_to new_user_session_path
		else
			@events = Event.all
		end
	end

	def new
		@event = Event.new
		@event.fields.build(event_id: @event.id)
	end

	def create
		@event = Event.new(event_params)
		if @event.valid?
			@event.user_id = current_user.id
			@event.save
			redirect_to events_path
		else
			flash[:alert] = "Description too short!"
			redirect_to new_event_path
		end
	end

	def show
		@event = Event.find(params[:id])
		@comments = @event.comments
		respond_to do |format|
			format.html {render :show}
			format.json {render json: @event}
		end
	end

	def edit
	end

	def update
		if @event.update(event_params)
		  redirect_to event_path(@event)
		else
			render :edit
		end
	end

	def destroy
		@event.destroy
		redirect_to events_path
	end

	private

	def set_current_event
		@event = Event.find(params[:id])
	end

	def event_params
		params.require(:event).permit(:name, :description, :user_id, fields_attributes: [:id, :name, :address, :city, :state])
	end
end

class CommentsController < ApplicationController
	before_action :set_current_comment, only: [:show, :edit, :update, :destroy]

	def index
		@event = Event.find(params[:event_id])
		@comments = Comment.all
	end

	def show

	end

	def new
		@event = Event.find(params[:event_id])
		@comment = Comment.new
	end

	def create
		@event = Event.find(params[:event_id])
		@comment = create_comment
		redirect_to event_comments_path(@event)
	end	

	def update
	end

	def edit
	end

	def destroy

	end

	private

	def set_current_comment
		@comment = Comment.find(params[:id])
	end

	def create_comment
		@event.comments.create(content: params[:comment][:content], user_id: current_user.id, event_id: @event.id)
	end

	def comment_params
		params.require(:comment).permit(:content, :user_id, :event_id)
	end 
end

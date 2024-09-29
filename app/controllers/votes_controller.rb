class VotesController < ApplicationController
	before_action :set_bill_post
	before_action :set_vote_type
	before_action :set_vote_result_cookie

	include ActionView::RecordIdentifier

	def create
		Vote.create!(vote_params)
		@vote_result = cookies["bill_post_#{@bill_post.id}_vote"]

		respond_to do |format|
			format.turbo_stream
		end
	end

	private

	def vote_params
		params.permit(:bill_post_id, :vote_type)
	end

	def set_bill_post
		@bill_post = BillPost.find(params[:bill_post_id])
	end

	def set_vote_type
		@vote_type = params[:vote_type]
	end

	def set_vote_result_cookie
  	current_vote = cookies["bill_post_#{@bill_post.id}_vote"]
		
		Vote.find_by(vote_type: @vote_type)&.destroy if current_vote == @vote_type
  	
  	vote_type = current_vote == @vote_type ? '' : @vote_type

    cookies["bill_post_#{@bill_post.id}_vote"] = {
      value: vote_type,
      expires: 1.week.from_now,
      path: '/'
    }		
	end
end
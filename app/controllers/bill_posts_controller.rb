class BillPostsController < AppllicationController
	def index
		@bill_posts = @bill_posts.all
		@bill_posts = @bill_posts.where(commitment: params[:commitments]) if params[:commitments].present?
	end
end
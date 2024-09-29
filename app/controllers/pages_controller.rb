class PagesController < ApplicationController
	def home
		@bill_posts = BillPost.all
	end
end

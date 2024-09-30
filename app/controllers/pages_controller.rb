class PagesController < ApplicationController
  def home
    @bill_posts = BillPost.all
    @bill_posts.order(created_at: :desc)
  end
end

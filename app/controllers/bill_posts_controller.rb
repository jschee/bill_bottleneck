# frozen_string_literal: true

class BillPostsController < ApplicationController
  before_action :set_filter_tags

  def index
    @bill_posts = BillPost.all
    @bill_posts = @bill_posts.joins(:tags).where(tags: { name: @filter_tags }).distinct if @filter_tags.present?
    @bill_posts = @bill_posts.order(created_at: :desc)

    respond_to(&:turbo_stream)
  end

  private

  def set_filter_tags
    return unless params[:filter].present?

    @filter_tags = params[:filter].map(&:downcase)
  end
end

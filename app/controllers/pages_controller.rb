# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :set_filter_tags

  def home
    @bill_posts = BillPost.all
    @bill_posts = @bill_posts.joins(:tags).where(tags: { name: @filter_tags }).distinct if @filter_tags.present?
    @bill_posts.order(created_at: :desc)
    @pagy, @bill_posts = pagy_countless(@bill_posts, limit: 5)

    render "scrollable_list", layout: false if params[:page]
  end

  private

  def set_filter_tags
    return unless params[:tags].present?

    @filter_tags = params[:tags].map(&:downcase)
  end
end

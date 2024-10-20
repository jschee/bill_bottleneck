# frozen_string_literal: true

class VotesController < ApplicationController
  before_action :set_bill_post
  before_action :set_vote_type
  before_action :set_vote_result_cookie, only: :create
  before_action :delete_vote_result_cookie, only: :destroy_vote

  include ActionView::RecordIdentifier

  def create
    Vote.create!(vote_params)
    @vote_result = cookies["bill_post_#{@bill_post.id}_vote"]

    respond_to(&:turbo_stream)
  end

  def destroy_vote
    vote = Vote.find_by(bill_post_id: @bill_post.id, vote_type: @vote_type)
    vote.destroy!

    respond_to(&:turbo_stream)
  end

  private

  def vote_params
    params.permit(:bill_post_id, :vote_type)
  end

  def set_bill_post
    @bill_post ||= BillPost.find(params[:bill_post_id])
  end

  def set_vote_type
    @vote_type ||= params[:vote_type]
  end

  def set_vote_result_cookie
    cookies["bill_post_#{@bill_post.id}_vote"] = {
      value: @vote_type,
      expires: 1.week.from_now,
      path: '/'
    }
  end

  def delete_vote_result_cookie
    cookies["bill_post_#{@bill_post.id}_vote"] = {
      value: '',
      expires: 1.week.from_now,
      path: '/'
    }
  end  
end

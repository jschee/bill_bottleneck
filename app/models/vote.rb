# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :bill_post
  enum vote_type: { up_vote: 0, down_vote: 1 }
end

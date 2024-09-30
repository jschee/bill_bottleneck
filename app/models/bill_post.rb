class BillPost < ApplicationRecord
  has_many :votes
  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings

  def calculate_vote_percentage
    # need to turn this into a job that runs every 3 hours
    # and updates column up_vote_percentage and down_vote_percentage
    return { upvote_percentage: 0, downvote_percentage: 0 } if total_votes == 0

    upvote_percentage = (total_up_votes.to_f / total_votes * 100).round
    downvote_percentage = (total_down_votes.to_f / total_votes * 100).round

    { upvote_percentage:, downvote_percentage: }
  end

  def total_up_votes
    votes.up_vote.size
  end

  def total_down_votes
    votes.down_vote.size
  end

  def total_votes
    total_up_votes + total_down_votes
  end

  def add_tag(tag_name)
    tag_name.gsub(/\b(And|Or|The)\b/, &:downcase)
    tag = Tag.find_or_create_by(name: tag_name)
    tags << tag unless tags.include?(tag)
  end
end

class Bill::Action < ApplicationRecord
  belongs_to :bill
  validates_presence_of %i[action_code action_date source_system text action_type]
end

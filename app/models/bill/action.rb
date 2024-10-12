class Bill::Action < ApplicationRecord
  belongs_to :bill
  validates_presenece_of %i[action_code action_date source_system text action_type]
end

class Bill::Summary < ApplicationRecord
  belongs_to :bill
  validates_presence_of %i[text]
end

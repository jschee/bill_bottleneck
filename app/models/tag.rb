# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :taggable, through: :taggings, source: :taggable

  TAGS = [
    'Finance',
    'Health',
    'Nationwide',
    'Income Groups',
    'Small Businesses',
    'Science and Technology',
    'Local State',
    'Education',
    'Military and Veteran',
    'Large Coporations'
  ].freeze
end

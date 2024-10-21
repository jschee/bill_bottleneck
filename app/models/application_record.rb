# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def initialize(params = nil)
    # Transformation of API-response JSON keys to snake_case
    params = deep_transform_keys_to_snake_case(params)
    super(params)
  end

  private

  def camel_to_snake_sym(camel_case)
    camel_case.to_s.gsub(/([A-Z])/, '_\1').downcase.sub(/^_/, '').to_sym
  end

  def deep_transform_keys_to_snake_case(hash)
    hash.each_with_object({}) do |(key, value), result|
      new_key = camel_to_snake_sym(key)
      new_value = value.is_a?(Hash) ? deep_transform_keys_to_snake_case(value) : value
      result[new_key] = new_value
    end
  end
end

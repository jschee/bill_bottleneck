class ApplicationController < ActionController::Base
  helper_method :format_tag_name

  def format_tag_name(tag_name)
    tag_name.titleize.gsub(/\b(And|Or|The)\b/, &:downcase)
  end
end

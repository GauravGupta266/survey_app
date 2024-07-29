class ApplicationController < ActionController::Base

  skip_before_action :verify_authenticity_token, if: :development_environment?

  private

  def development_environment?
    Rails.env.development?
  end

end

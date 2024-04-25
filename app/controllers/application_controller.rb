class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :render404

  def render404(error = nil)
    Rails.logger.error("❌#{error.message}") if error
    render template: 'layouts/no_page', status: :not_found
  end
end

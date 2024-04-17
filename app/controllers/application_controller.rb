class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :authenticate_user!

  after_action :verify_authorized, unless: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    $stdout.puts "Pundit::NotAuthorizedError" if Rails.env.test?

    flash[:alert] = t("flash.unauthorized")

    redirect_back(fallback_location: root_path)
  end
end

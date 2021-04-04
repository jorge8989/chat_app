class ApplicationController < ActionController::Base
  include ActionController::Cookies

  before_action :authenticate_user!
  before_action :set_user_cookie

  private
  def set_user_cookie
    if !cookies&.signed[:user_id] && current_user
      cookies.signed[:user_id] = current_user.id
    end
  end
end

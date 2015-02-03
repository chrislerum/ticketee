class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def authorize_admin!
    require_signin!

    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end

  def require_signin!
    if current_user.nil?
      flash[:error] =
        "You need to sign in or sign up before continuing."
      redirect_to sign_in_url
    end
  end
  helper_method :require_signin!

end

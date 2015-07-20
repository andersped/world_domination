class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   def confirm_logged_in
    unless session[:user_id]
      redirect_to login_path, alert: "Please log in"
    end
  end

  # Stop a logged in user from going to the sign up page
  def prevent_login_signup
    if session[:user_id]
      redirect_to :back, notice: "You are already logged in"
      # what do you think redirect_to :back does?
    end
  end

   def current_user
   # Let's not make a database query if we don't need to!
    return unless session[:user_id]
   # Defines @current_user if it is not already defined.
    @current_user ||= User.find_by_id(session[:user_id])
  end
  helper_method :current_user # make it available in views (it will be available in all controllers as well because they inherit from `ApplicationController`)
end

  def ensure_correct_user_for_team
      team = Team.find params[:id]
        unless team.user.id == session[:user_id]
          redirect_to :back, alert:  "Not authorized"
        end
  end

  def insure_correct_user
    unless params[:id].to_i == session[:user_id]
      redirect_to teams_path, alert: "Not authorized"
    end
    # user = User.find_by_id(session[:user_id])
    #   unless user == session[:user_id]
    #     redirect_to :back, alert: "You're not the correct user"
    #   end

  end


class ApplicationController < ActionController::Base
    before_action :set_current_user

    def set_current_user
      if session[:user_id]
       Current.user = User.find_by(id: session[:user_id])   
      end
    end
    def admin_check
      redirect_to home_path, alert: 'You are not authorized to access this page.' unless current_user&.admin?
    end


end
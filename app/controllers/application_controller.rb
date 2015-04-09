class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper :all

  def login_required
    if current_admin.blank?
      respond_to do |format|
        format.html { authenticate_admin!}
        format.js {render :partial => "common/not_loginned"}
        format.all { :unauthorized }
      end
    end
  end

end

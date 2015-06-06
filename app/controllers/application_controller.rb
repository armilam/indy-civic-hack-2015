class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_filter :authenticate_user!

  private

  def after_sign_in_path_for(user)
    if user.admin?
      admin_issues_path
    else
      students_path
    end
  end
end

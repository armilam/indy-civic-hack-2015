class Admin::ApplicationController < ApplicationController

  before_filter :authenticate_admin!

  private

  def authenticate_admin!
    raise "Not found" unless current_user.admin?
  end
end
class Admin::ApplicationsController < Admin::ApplicationController

  def index
    @applications = Application.all
  end

  def show
  end

  def search
  end
end

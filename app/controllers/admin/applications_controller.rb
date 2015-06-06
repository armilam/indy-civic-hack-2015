class Admin::ApplicationsController < Admin::ApplicationController

  def index
    @applications = Application.all
  end

  def show
  end

  def search
    @applications = Application
      .joins(:student)
      .where("(students.first_name || ' ' || students.middle_name || ' ' || students.last_name) ilike :student_name", student_name: "%#{params[:student_name]}%")

    @student_name = params[:student_name]

    render :index
  end
end

class ApplicationsController < ApplicationController

  def new
    @student = current_user.students.find(params[:student_id])
    @application = @student.applications.new
  end

  def create
    @student = current_user.students.find(params[:student_id])
    @application = @student.applications.new(application_params)

    if @application.save
      redirect_to @student, flash: { notice: "New application added!" }
    else
      flash[:warning] = "Sorry, there was an error with your submission."
      render "form"
    end
  end

  private

  def application_params
    params.require(:application).permit(:wl_building, :wl_program)
  end
end

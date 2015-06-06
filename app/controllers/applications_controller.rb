class ApplicationsController < ApplicationController

  def new
    @student = current_user.students.find(params[:student_id])
    @application_form = ApplicationForm.new(@student)
  end

  def create
    @student = current_user.students.find(params[:student_id])
    @application_form = ApplicationForm.new(@student, application_params)

    if @application_form.save
      redirect_to @student, flash: { notice: "New application added!" }
    else
      flash[:warning] = "Sorry, there was an error with your submission."
      render "new"
    end
  end

  private

  def application_params
    params.require(:application_form).permit(:first_choice_building, :first_choice_program,
      :second_choice_building, :second_choice_program, :third_choice_building, :third_choice_program)
  end
end

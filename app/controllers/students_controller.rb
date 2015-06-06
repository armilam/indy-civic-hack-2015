class StudentsController < ApplicationController

  def index
    @students = current_user.students
  end

  def show
  end

  def new
    @student = current_user.students.new
  end
end

class Admin::StudentsController < Admin::ApplicationController

  def index
    @students = if current_user.admin?
      Student.all
    else
      current_user.students
    end
  end

  def show
    @student = if current_user.admin?
      Student.find(params[:id])
    else
      current_user.students.find(params[:id])
    end
  end

  def search
    @students = Student.where("(students.first_name || ' ' || students.middle_name || ' ' || students.last_name) ilike :student_name", student_name: "%#{params[:student_name]}%")

    @student_name = params[:student_name]

    render :index
  end

  def new
    @student = current_user.students.new
  end

  def create
    student = Student.find_by(ips_id: params["student"]["ips_id"], birthdate: parsed_birthdate)

    if student
      current_user.user_students.create(student: student)
      redirect_to students_path, flash: { notice: "New student added!" }
    else
      @student = current_user.students.new
      flash[:warning] = "Sorry, we couldn’t find a student with that ID and birthdate."
      render "new"
    end
  end

  private

  def parsed_birthdate
    date_parts = params["student"].values_at("birthdate(1i)", "birthdate(2i)", "birthdate(3i)").map(&:to_i)
    Date.new(*date_parts)
  end
end

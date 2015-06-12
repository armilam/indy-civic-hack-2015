class Admin::WaitlistController < Admin::ApplicationController

  def index

  end

  def search_by_application(search_term)
    Student.where("#{application.student_id} LIKE search_term")
  end

  def search_by_student(search_term)
    if search_term.kind_of?(Integer)
      Student.where("#{student.ips_id} LIKE search_term")
    else
      Student.where("#{student.first_name + " " + student.middle_name + " " +student.last_name} LIKE search_term")
    end
  end
end

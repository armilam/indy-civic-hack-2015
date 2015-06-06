class Admin::IssuesController < Admin::ApplicationController

  def index
    @issues = Issue.where(owner: current_user)
  end

  def show
    @issue = Issue.find(params[:id])
    @events = @issue.events.in_order
  end

  def search
    @issues = Issue.all
    @issues = @issues.joins("JOIN students ON students.id = issues.subject_id AND issues.subject_type = 'Student'") if should_join_students?

    if params[:student_name].present?
      @issues = @issues.where("(students.first_name || ' ' || students.middle_name || ' ' || students.last_name) ilike :student_name", student_name: "%#{params[:student_name]}%")
    end

    if params[:student_ips_id].present?
      @issues = @issues.where("students.ips_id ilike :ips_id", ips_id: "%#{params[:student_ips_id]}%")
    end

    if params[:description].present?
      @issues = @issues.where("description ilike :description", description: "%#{params[:description]}%")
    end

    if params[:status].present?
      @issues = @issues.where(status: params[:status])
    end

    if params[:admin_id].present?
      @issues = @issues.where(owner_admin_id: params[:admin_id])
    end
  end

  private

  def should_join_students?
    return true if params[:student_name].present?
    return true if params[:student_ips_id].present?
  end

end

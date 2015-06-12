class ApplicationForm

  include ActiveModel::Model

  attr_accessor :first_choice_building,
                :first_choice_program,
                :second_choice_building,
                :second_choice_program,
                :third_choice_building,
                :third_choice_program

  validates :first_choice_building, presence: true
  validates :first_choice_program, presence: true

  def initialize(student, params = {})
    @student = student
    @params = params
    assign_params(params)
  end

  def persisted?
    false
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  def persist!
    ActiveRecord::Base.transaction do
      if first_choice_building != 'Choose a School' && first_choice_program != 'Choose a Program'
        @student.applications.create(current_building: first_choice_building,
                                     current_program: first_choice_program)
      end
      if second_choice_building != 'Choose a School' && second_choice_program != 'Choose a Program'
        @student.applications.create(current_building: second_choice_building,
                                     current_program: second_choice_program)
      end
      if third_choice_building != 'Choose a School' && third_choice_program != 'Choose a Program'
        @student.applications.create(current_building: third_choice_building,
                                     current_program: third_choice_program)
      end
    end
  end

  def assign_params(params)
    self.first_choice_building = params["first_choice_building"]
    self.first_choice_program = params["first_choice_program"]
    self.second_choice_building = params["second_choice_building"]
    self.second_choice_program = params["second_choice_program"]
    self.third_choice_building = params["third_choice_building"]
    self.third_choice_program = params["third_choice_program"]
  end
end

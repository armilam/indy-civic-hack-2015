class Application < ActiveRecord::Base
  belongs_to :student, required: true
  has_many :attachments

  def interpreted_status
    status = self.status
    case status
    when 1
      "In Progress"
    when 2
      "Accepted"
    when 3
      position = Application.where("building = ? AND program = ? AND status = 3", self.building, self.program).order("random asc").pluck(:id).index(self.id)
      "Waitlist Position: #{position}"
    when 4
      "Not Accepted"
    when 5
      "Application Cancelled"
    end
  end
end

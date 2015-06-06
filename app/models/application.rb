class Application < ActiveRecord::Base
  belongs_to :student, required: true
  has_many :attachments

  validates :wl_building, presence: true
  validates :wl_program, presence: true
end

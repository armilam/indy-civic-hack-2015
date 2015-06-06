class Application < ActiveRecord::Base
  belongs_to :student, required: true
  has_many :attachments
end

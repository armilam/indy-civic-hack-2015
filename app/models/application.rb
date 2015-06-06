class Application < ActiveRecord::Base
  belongs_to :student
  has_many :attachments
end
class Attachment < ActiveRecord::Base
  has_attached_file :file
  belongs_to :application
end
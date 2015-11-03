class Project < ActiveRecord::Base
	belongs_to :organization
	serialize :causes_interest, Array
  serialize :clasification, Array
	mount_uploader :photo_project, LogoUploader
end

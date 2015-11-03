class Project < ActiveRecord::Base
	belongs_to :organization
	serialize :causes_interest, Array
	mount_uploader :photo_project, LogoUploader
end

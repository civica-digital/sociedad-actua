class Project < ActiveRecord::Base
	belongs_to :organization
	mount_uploader :photo_project, LogoUploader
end

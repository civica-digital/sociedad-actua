class Project < ActiveRecord::Base
	belongs_to :organization
	mount_uploader :photo_project, LogoUploader

	scope :multisearch, -> (search_param) {
		includes(:organization).
		where("projects.name LIKE ? OR
			LOWER(projects.description) LIKE ? OR
			LOWER(projects.causes_interest) LIKE ? OR
			LOWER(projects.other_causes) LIKE ? OR
			LOWER(organizations.name) LIKE ?",
			"%#{search_param.downcase}%",
			"%#{search_param.downcase}%",
			"%#{search_param.downcase}%",
			"%#{search_param.downcase}%",
			"%#{search_param.downcase}%"
			).
		references(:organization)
	}
end

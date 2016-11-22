class Project < ActiveRecord::Base
	belongs_to :projectable, polymorphic: true
	serialize :causes_interest, Array
  serialize :clasification, Array
	serialize :collaborators, Array
	mount_uploader :photo_project, LogoUploader
	before_save :validate_causes
	before_save :validate_collaborators
	# default_scope { order('projects.id ASC') }

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
	private
	  def validate_causes
	    self.causes_interest.delete("")
		end

		def validate_collaborators
			self.collaborators.delete("")
		end
end

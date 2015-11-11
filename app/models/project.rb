class Project < ActiveRecord::Base
	belongs_to :organization
	serialize :causes_interest, Array
  serialize :clasification, Array
	mount_uploader :photo_project, LogoUploader
	before_save :validate_causes

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

	    if (self.causes_interest[0]== "")
	      self.causes_interest.delete("")
	    end  
	  end
end

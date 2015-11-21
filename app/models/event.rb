class Event < ActiveRecord::Base
	validates :name, :description, :date,:time, :address, :notes, presence:  true
    belongs_to :organization
    before_save :validate_causes
    serialize :causes, Array
    mount_uploader :image, LogoUploader

    private
	  def validate_causes
	    if (self.causes[0]== "")
	      self.causes.delete("")
	    end  
	  end
end

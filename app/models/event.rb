class Event < ActiveRecord::Base
	validates :name, :description, :date,:time, :address, :notes, presence:  true
    belongs_to :organization
    serialize :causes, Array
    mount_uploader :image, LogoUploader
end

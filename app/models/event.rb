class Event < ActiveRecord::Base
    belongs_to :organization
    serialize :causes, Array
    mount_uploader :image, LogoUploader
end

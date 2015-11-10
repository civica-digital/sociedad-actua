class Event < ActiveRecord::Base
    belongs_to :organization
    mount_uploader :image, LogoUploader
end

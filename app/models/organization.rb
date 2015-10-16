class Organization < ActiveRecord::Base
  has_many :profile, as: :profile
end

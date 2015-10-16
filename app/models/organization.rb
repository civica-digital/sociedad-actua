class Organization < ActiveRecord::Base
  has_one :user, as: :profile
end

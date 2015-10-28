class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_initialize :set_default_role, :if => :new_record?

  belongs_to :profile, polymorphic: true

  rolify :role_cname => 'Role'

  def set_default_role
    if User.count == 0
      self.add_role :admin
    end
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['name'] || ""
      end
    end
  end

  def collaborator?
    has_profile?('Collaborator') && self.profile.present?
  end

  def investor?
    has_profile?('Investor') && self.profile.present?
  end

  def organization?
    has_profile?('Organization') && self.profile.present?
  end

  def has_profile?(profile)
    self.profile_type == profile
  end
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_initialize :set_default_role, :if => :new_record?

  belongs_to :profile, polymorphic: true

  rolify :role_cname => 'Role'
  before_crate :create_resource

  before_create :create_resource

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

  

  def create_resource 
    
      @organization=Organization.create
      

        
  end

  private
  # Refactor this ASAP
  # we shouldn't be setting a resource in this way
  def create_resource
    case self.profile_type = self.profile_type.capitalize
    when 'Organization'
      self.profile = Organization.create(email: self.email)
    when 'Collaborator'
      self.profile = Collaborator.create(email: self.email)
    when 'Investor'
      self.profile = Investor.create(email: self.email)
    end
  end
end

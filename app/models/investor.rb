class Investor < ActiveRecord::Base
  serialize :causes_supported, Array
  serialize :organization, Array
  before_save :validate_causes
  before_save :validate_organizations
  has_one :user, as: :profile
  has_many :organizations
  mount_uploader :logo, LogoUploader

  validates :name, :type_investor,  presence:  true, on: :update

  validates :name, :length => { :minimum => 2 },if: Proc.new { |a| a.name.present? }
  
  validates :type_investor, :inclusion => { :in => INVESTOR_TYPE.map(&:to_s),
                                                :message => "%{value} no es un tipo de inversionista valido",on: :update }


 validates :site_url, format: { with: /((ftp|http|https):\/\/)?[a-zA-Z0-9\-\#\/\_]+[\.][a-zA-Z0-9\-\.\#\/\_]+/i }, if: Proc.new { |a| a.site_url.present? }
 validates :facebook_url, format: { with: /((ftp|http|https):\/\/)?[a-zA-Z0-9\-\#\/\_]+[\.][a-zA-Z0-9\-\.\#\/\_]+/i }, if: Proc.new { |a| a.facebook_url.present? }
 validates :blog_url, format: { with: /((ftp|http|https):\/\/)?[a-zA-Z0-9\-\#\/\_]+[\.][a-zA-Z0-9\-\.\#\/\_]+/i }, if: Proc.new { |a| a.blog_url.present? }
 validates :youtube_url, format: { with: /((ftp|http|https):\/\/)?[a-zA-Z0-9\-\#\/\_]+[\.][a-zA-Z0-9\-\.\#\/\_]+/i }, if: Proc.new { |a| a.youtube_url.present? }
 validates :instagram_url, format: { with: /((ftp|http|https):\/\/)?[a-zA-Z0-9\-\#\/\_]+[\.][a-zA-Z0-9\-\.\#\/\_]+/i }, if: Proc.new { |a| a.instagram_url.present? }
 validates :twitter_url, format: { with: /((ftp|http|https):\/\/)?[a-zA-Z0-9\-\#\/\_]+[\.][a-zA-Z0-9\-\.\#\/\_]+/i }, if: Proc.new { |a| a.twitter_url.present? }


 validates :zipcode, :format => { :with => /[0-9]{5}/} ,presence:  true, on: :update
 validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: [:create,:update] }, presence:  true, on: :update,if: Proc.new { |a| a.email.present? }
  private
  def validate_causes
    self.causes_supported.delete("")
  end
  
   def validate_organizations
    self.organization.delete("")
  end
end

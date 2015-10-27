class Investor < ActiveRecord::Base
  has_one :user, as: :profile
  mount_uploader :logo, LogoUploader

  validates :name, :type_investor, :characteristics, presence: true

  validates :name, :length => { :minimum => 2 }
  validates :characteristics, :length => { :maximum => 500 }, allow_blank: false

  validates :type_investor, :inclusion => { :in => INVESTOR_TYPE.map(&:to_s),
                                                :message => "%{value} no es un tipo de inversionista valido" }


 validates :site_url, format: { with: URI.regexp }, if: Proc.new { |a| a.site_url.present? }
 validates :facebook_url, format: { with: URI.regexp }, if: Proc.new { |a| a.facebook_url.present? }
 validates :blog_url, format: { with: URI.regexp }, if: Proc.new { |a| a.blog_url.present? }

 validates :zipcode, :format => { :with => /[0-9]{5}/}, presence: true

 validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end

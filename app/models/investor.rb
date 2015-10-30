class Investor < ActiveRecord::Base
  serialize :causes_supported, Array
  has_one :user, as: :profile
  mount_uploader :logo, LogoUploader

  validates :name, :type_investor,  presence:  true, on: :update

  validates :name, :length => { :minimum => 2 },if: Proc.new { |a| a.name.present? }
  
  validates :type_investor, :inclusion => { :in => INVESTOR_TYPE.map(&:to_s),
                                                :message => "%{value} no es un tipo de inversionista valido",on: :update }


 validates :site_url, format: { with: URI.regexp }, if: Proc.new { |a| a.site_url.present? }
 validates :facebook_url, format: { with: URI.regexp }, if: Proc.new { |a| a.facebook_url.present? }
 validates :blog_url, format: { with: URI.regexp }, if: Proc.new { |a| a.blog_url.present? }

 validates :zipcode, :format => { :with => /[0-9]{5}/} ,presence:  true, on: :update
 validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: [:create,:update] }, presence:  true, on: :update,if: Proc.new { |a| a.email.present? }
end

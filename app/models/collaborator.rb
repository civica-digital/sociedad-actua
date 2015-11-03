class Collaborator < ActiveRecord::Base
  has_one :user, as: :profile
  mount_uploader :logo, LogoUploader

  validates :email, :type_collaborator, :description, presence:  true, on: :update
  validates :email, uniqueness: true

  validates :name, :length => { :minimum => 2 },if: Proc.new { |a| a.name.present? }
  validates :description, :length => { :maximum => 500 }, allow_blank: false, on: :update

  validates :type_collaborator, inclusion: {
                                  :in => %w{Asesor(a) Voluntario(a) Periodista Investigador(a)},
                                  :message => "%{value} no es un tipo de collaborador valido"
                                }, on: :update
  validates :site_url, format: { with: URI.regexp }, if: Proc.new { |a| a.site_url.present? }
  validates :facebook_url, format: { with: URI.regexp }, if: Proc.new { |a| a.facebook_url.present? }
  validates :instagram_url, format: { with: URI.regexp }, if: Proc.new { |a| a.instagram_url.present? }
  validates :twitter_url, format: { with: URI.regexp }, if: Proc.new { |a| a.twitter_url.present? }
  validates :youtube_url, format: { with: URI.regexp }, if: Proc.new { |a| a.youtube_url.present? }
  validates :blog_url, format: { with: URI.regexp }, if: Proc.new { |a| a.blog_url.present? }

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }


end

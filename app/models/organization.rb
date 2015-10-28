class Organization < ActiveRecord::Base
  serialize :causes_interest, Array
  has_one :user, as: :profile
  has_many :projects
  mount_uploader :logo, LogoUploader

  validates :name, :type_organization, :email, :presence =>  true
  validates :email, :uniqueness => true
  validates :name, :length => { :minimum => 2 }
  validates :mision, :length => { :maximum => 500 }, presence: true, allow_blank: false
  validates :type_organization, :inclusion => { :in => ORGANIZATION_TYPE.map(&:to_s),
                                                :message => "%{value} no es un tipo de organización valido"}, presence: true

  validates :foundation, :inclusion =>  { :in => 1900..2040 }, presence: true

  validates :address, :colonia, :town, presence: true

  # TODO: validar formato de correo
  # validates :email,
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  # TODO: validar formato de
  # validates :rfc
  validates :rfc, format: { with: /\A[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9]([A-Z0-9]{3})?\z/i, message: 'No es un formato de RFC válido' }, if: Proc.new { |a| a.rfc.present? }

  validates :zip, :format => { :with => /[0-9]{5}/}

  # TODO: validar numero de telefono
  # validates: telephone, hay que analizar que tipo de telefono , cuantos digitos, etc
  #validates :telephone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "Formato no válido" }

  # TODO: validar el formato de url para sitio y redes sociales
  # validates_with URLValidator, fields: [:site, :blog, facebook, youtube, instagram, twitter]
  validates :site, format: { with: URI.regexp }, if: Proc.new { |a| a.site.present? }
  validates :blog, format: { with: URI.regexp }, if: Proc.new { |a| a.blog.present? }
  validates :facebook, format: { with: URI.regexp }, if: Proc.new { |a| a.facebook.present? }
  validates :youtube, format: { with: URI.regexp }, if: Proc.new { |a| a.youtube.present? }
  validates :instagram, format: { with: URI.regexp }, if: Proc.new { |a| a.instagram.present? }
  validates :twitter, format: { with: URI.regexp }, if: Proc.new { |a| a.twitter.present? }

  validates :show_address, :show_town, :show_colonia,
            :show_telephone, :show_zip, :show_email, :inclusion => { :in => [true, false] }, allow_blank: true
end

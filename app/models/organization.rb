class Organization < ActiveRecord::Base
  has_one :user, as: :profile

  validates :name, :type_organization, :email, :presence =>  true
  validates :name, :email, :uniqueness => true
  validates :name, :length => { :minimum => 2 }
  validates :mision, :length => { :maximum => 500 }, presence: true, allow_blank: false
  validates :type_organization, :inclusion => { :in => %w{ACs ABPs Colectivos Grupos },
                                                :message => "%{value} no es un tipo de organización valido"}, presence: true

  validates :foundation, :inclusion =>  { :in => 1900..2040 }, presence: true

  validates :address, :colonia, :town, :telephone, presence: true

  # TODO: validar formato de correo
  # validates :email,

  # TODO: validar formato de
  # validates :rfc

  validates :zip, :format => { :with => /[0-9]{5}/}, presence: true

  # TODO: validar numero de telefono
  # validates: telephone

  # TODO: validar el formato de url para sitio y redes sociales
  # validates_with URLValidator, fields: [:site, :blog, facebook, youtube, instagram, twitter]
end

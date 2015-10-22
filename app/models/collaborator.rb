class Collaborator < ActiveRecord::Base
  validates :email, :name, :type_collaborator, :description, presence: true
  validates :email, :name, uniqueness: true

  validates :name, :length => { :minimum => 2 }
  validates :description, :length => { :maximum => 500 }, allow_blank: false

  validates :type_collaborator, :inclusion => { :in => %w{Asesor(a) Voluntario(a) Periodista},
                                                :message => "%{value} no es un tipo de collaborador valido" }
end

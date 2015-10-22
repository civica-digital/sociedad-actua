class Investor < ActiveRecord::Base
  validates :name, :type, :characteristics, presence: true

  validates :name, :length => { :minimum => 2 }
  validates :mantra, :characteristics, :length => { :maximum => 500 }, allow_blank: false

  validates :type, :inclusion => { :in => %w{Fundación Empresa Individuo},
                                                :message => "%{value} no es un tipo de inversionista valido" }
end

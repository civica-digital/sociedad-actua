class Investor < ActiveRecord::Base
  validates :name, :type_investor, :characteristics, presence: true

  validates :name, :length => { :minimum => 2 }
  validates :mantra, :characteristics, :length => { :maximum => 500 }, allow_blank: false

  validates :type_investor, :inclusion => { :in => %w{Fundación Empresa Individuo},
                                                :message => "%{value} no es un tipo de inversionista valido" }
end

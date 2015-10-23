class Investor < ActiveRecord::Base
  has_one :user, as: :profile

  validates :name, :type_investor, :characteristics, presence: true

  validates :name, :length => { :minimum => 2 }
  validates :characteristics, :length => { :maximum => 500 }, allow_blank: false

  validates :type_investor, :inclusion => { :in => %w{Fundación Empresa Individuo},
                                                :message => "%{value} no es un tipo de inversionista valido" }
end

require 'faker'

FactoryGirl.define do
  factory :collaborator do |f|
    f.name { Faker::Name.name }
    f.email { Faker::Internet.email }
    f.description { Faker::Lorem.sentence }
    f.type { %w{Asesor(a) Voluntario(a) Periodista}.sample }
  end

end

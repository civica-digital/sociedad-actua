require 'faker'

FactoryGirl.define do
  factory :organization do | f |
      f.name { Faker::Company.name }
      f.type_organization  "ACs"
      f.email { Faker::Internet.email }
      f.mision { Faker::Lorem.sentence }
      f.zip { Faker::Number.number(5).to_s }
      f.telephone { Faker::PhoneNumber.cell_phone }
      f.site { Faker::Internet.url }
      f.foundation { Faker::Number.between(1980, 2020) }
  end
end

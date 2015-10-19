require 'faker'

FactoryGirl.define do
  factory :organization do | f |
      f.name { Faker::Company.name }
      f.type_organization  "ACs"
      f.email { Faker::Internet.email }
      f.mision { Faker::Lorem.paragraph }
      f.zip { Faker::Number.number(5) }
      f.telephone { Faker::PhoneNumber.cell_phone }
      f.site { Faker::Internet.url }
  end
end

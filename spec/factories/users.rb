require 'faker'

FactoryGirl.define do

  factory :user do | f |
    f.name { Faker::Company.name }
end

end

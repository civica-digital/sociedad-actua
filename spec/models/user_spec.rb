require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) { @user = FactoryGirl.create(:user) }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:encrypted_password) }
  it { should respond_to(:password) }


  it { should be_valid }

  it "name should be an instance of String" do
    expect(@user.name).to be_instance_of String
  end

  it "email should be instance of String" do
    expect(@user.email).to be_instance_of String
  end


  it "is admin if the first is" do
    is_expected.to have_role(:admin)
  end

  it "is a user if isn't a admin" do
    another_user = FactoryGirl.create(:user)

    expect(another_user).to have_role(:user)
  end

  it "fails if password length is less than 8" do
    another_user = FactoryGirl.create(:user)

    another_user.password = Faker::Number.number(7)

    expect(another_user).to_not be_valid
  end

end

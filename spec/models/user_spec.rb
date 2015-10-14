require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) { @user = FactoryGirl.create(:user) }

  subject { @user }

  it { should respond_to(:name) }

  it { should be_valid }

  it { expect(@user.name).to be_instance_of String  }

  it "is admin if the first is" do
    is_expected.to have_role(:admin)
  end

  it "is a user if isn't a admin" do
    another_user = FactoryGirl.create(:user)

    expect(another_user).to have_role(:user)
  end


end

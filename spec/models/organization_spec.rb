require 'rails_helper'

RSpec.describe Organization, type: :model do
  before(:each) { @user = FactoryGirl.create(:organization) }



  describe "Should be valid and verify the required fields" do
    subject { @user }

    it { should be_valid }

    it "should have always email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "should have always a name"  do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it "should have always an organization's type"  do
      @user.type_organization = nil
      expect(@user).to_not be_valid
    end
  end
end

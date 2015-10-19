require 'rails_helper'

RSpec.describe Organization, type: :model do
  before(:each) { @organization = FactoryGirl.create(:organization) }



  describe "Should be valid and verify the required fields" do
    subject { @organization }

    it { should be_valid }

    it "should have always email" do
      @organization.email = nil
      expect(@organization).to_not be_valid
    end

    it "should have always a name"  do
      @organization.name = nil
      expect(@organization).to_not be_valid
    end

    it "should have always an organization's type"  do
      @organization.type_organization = nil
      expect(@organization).to_not be_valid
    end
  end
end

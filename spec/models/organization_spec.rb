require 'rails_helper'

RSpec.describe Organization, type: :model do
  before(:each) { @user = FactoryGirl.create(:organization) }



  describe "Should validates every field" do
    subject { @user }

    it { should be_valid }

    it "should have always email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end
    
  end
end

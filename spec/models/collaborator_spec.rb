require 'rails_helper'

RSpec.describe Collaborator, type: :model do
  before(:each) { @collaborator = FactoryGirl.create(:collaborator)}

  subject { @collaborator }

  it { should be_valid }

  describe "When to create a new collaborator" do

    [:email, :name, :description, :type_collaborator].each do |f|
      it "doesn't be valid if #{f} is nil" do
        method = @collaborator.method("#{f}=".to_sym)
        method.call nil
        should_not be_valid
      end
    end

  end
end

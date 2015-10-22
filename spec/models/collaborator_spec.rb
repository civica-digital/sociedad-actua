require 'rails_helper'

RSpec.describe Collaborator, type: :model do
  before(:each) { @collaborator = FactoryGirl.create(:collaborator)}

  subject { @collaborator }

  it { should be_valid }
end

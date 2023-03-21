require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'validations' do
    subject { Profile.new(username: 'test-profile-unique') }

    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should_not allow_value('test_with_underscore').for(:username) }
    %w[* _ $ % & / ( )].each do |c|
      it { should_not allow_value(c).for(:username) }
    end
    it { should allow_value('successful-test').for(:username) }
  end

  describe 'relations' do
    it { should have_many(:repositories) }
  end
end

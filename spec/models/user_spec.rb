require 'rails_helper'

describe User do
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should validate_confirmation_of :password }

  describe ".authenticate" do
    it "will authenticate a user when their email and password match the database" do
      user = FactoryGirl.create(:user)
      expect(User.authenticate(user.email, user.password)).to eq user
    end

    it "will not authenticate a user when their email or password do not match the database" do
      user = FactoryGirl.create(:user)
      expect(User.authenticate(user.email, "stuff")).to eq nil
    end
  end
end
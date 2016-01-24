require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = build(:user)
  end

  describe "initialized in before(:each)" do
    it "can build" do
      expect(@user.email).to eq("user@user.user")
    end

    it "can be created" do
      @user.save!
      expect(User.count).to eq(1)
    end

    it "is invalid without email" do
      @user.email = nil
      expect(@user).to be_invalid
    end

    it "is invalid without password" do
      @user.password = nil
      expect(@user).to be_invalid
    end

    it "is invalid without first name" do
      @user.first_name = nil
      expect(@user).to be_invalid
    end

    it "is invalid without last name" do
      @user.last_name = nil
      expect(@user).to be_invalid
    end

    it "is completely valid" do
      expect(@user).to be_valid
    end
  end
end

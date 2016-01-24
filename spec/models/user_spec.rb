require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = build(:user)
  end

  describe "initialized in before(:each)" do
    it "can be created" do
      expect { @user.save! }.to change(User, :count).from(0).to(1)
    end

    it "is invalid without email" do
      @user.email = nil
      expect(@user).to be_invalid
    end

    it "is invalid without password" do
      @user.password = nil
      expect(@user).to be_invalid
    end

    it "is invalid without password confirmation" do
      @user.password_confirmation = nil
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

    it "has correct full_name" do
      expect(@user.full_name).to eq("#{@user.first_name} #{@user.last_name}")
    end
  end
end

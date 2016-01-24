require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {
    FactoryGirl.build(:user)
  }

  describe "model" do
    it "can be created" do
      expect { user.save! }.to change(User, :count).from(0).to(1)
    end

    it "has an array of tasks" do
      expect(user.tasks).to eq([])
    end

    it "has correct full_name" do
      expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
    end
  end

  describe "is invalid" do
    it "without email" do
      user.email = nil
      expect(user).to be_invalid
    end

    it "without password" do
      user.password = nil
      expect(user).to be_invalid
    end

    it "when password is not at least 8 characters" do
      user.password = "abc456"
      expect(user).to be_invalid
    end

    it "without password_confirmation" do
      user.password_confirmation = nil
      expect(user).to be_invalid
    end

    it "without first name" do
      user.first_name = nil
      expect(user).to be_invalid
    end

    it "without last name" do
      user.last_name = nil
      expect(user).to be_invalid
    end
  end

  it "is completely valid" do
    expect(user).to be_valid
  end
end

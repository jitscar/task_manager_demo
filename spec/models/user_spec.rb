require 'rails_helper'

RSpec.describe User, type: :model do
  it "was created" do
    expect(build(:user).email).to eq("user@user.user")
    expect(User.count).to eq(1)
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation texts" do
    it "ensures the email is present" do
      user = User.new(password: "securepassword123")
      expect(user.valid?).to eq(false)
    end

    it "ensures the password is present" do
      user = User.new(email: "name@email.com")
      expect(user.valid?).to eq(false)
    end

    it "should allow a signup" do
      user = User.new(email: "name@email.com", password: "securepassword123")
      expect(user.valid?).to eq(true)
    end
  end
end

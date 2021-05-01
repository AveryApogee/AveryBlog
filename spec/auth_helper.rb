require 'spec_helper'

module AuthHelper
  def login_user
    @request.env["desivse.mapping"] = Devise.mappings[:user]
    user = FactoryBot.create(:user)
    sign_in user
  end
end

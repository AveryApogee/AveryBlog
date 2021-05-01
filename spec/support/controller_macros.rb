module ControllerMacros
  def login_user
    # Before each test, create and login the user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      #user = FactoryBot.create(:user)
      # user.confirm! # Necessary only if using "confirmable module
      #sign_in user

      sign_in FactoryBot.create(:user)
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      # user.confirm!
      sign_in user
    end
  end
end

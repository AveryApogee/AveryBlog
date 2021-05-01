class ApplicationController < ActionController::Base
    
    # include Devise::Test::ControllerHelpers
    
    # def setup
    #     @request.env["devise.mapping"] = Devise.mappings[:user]
    #     sign_in FactoryBot.create(:user)
    # end

    #before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end



end

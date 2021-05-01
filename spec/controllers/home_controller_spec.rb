require 'rails_helper'
require_relative "../support/devise"

#RSpec.configure {|c| c.before { expect(controller).not_to be_nil }}

RSpec.describe HomeController, type: :controller do
  #@request.env["devise.mapping"] = Devise.mappings[:user]
  #login_user

  describe "GET /" do
    login_user

    context "from login user" do
      it "should return 200:0K" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "Check login" do
    login_user

    context "from user" do
      it "should be successful" do
        get :index
        expect(subject.current_user).to_not be_nil
      end
    end
  end

  let(:valid_attributes) {
    { :title => "Test Title!", :description => "This is a test description", :body => "This is a test body" }
  }

  let("valid_session") { {} }

  describe "GET #index" do
    login_user
    it "returns http success" do
      Post.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful # HTTP Status code 200
      #expect(response).to have_http_status(302)
    end
  end

  
  # BLANK TEST, please ignore
  #describe "GET index" do
  #  it "has a 200 status code" do
  #    get :index
  #    expect(response.status).to eq(200)
  #  end
  #end

end

require 'rails_helper'

describe UsersController do
  context "signup" do
    it "should failed with illegal params" do
      post :create, params: { user: { email: 'ajream.gd' } }
      expect(response).to render_template("new")
    end

    it "should success with correct params" do
      post :create, params: { user: 
        { 
          email: 'ajream.gd@gmail.com', 
          password: '123456', 
          password_confirmation: '123456' 
        } 
      }
      expect(response).to redirect_to(new_session_path)
    end
  end
end
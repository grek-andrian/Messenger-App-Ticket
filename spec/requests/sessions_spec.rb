
require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "Sessions" do
    it "signs user in and out" do
      user = FactoryGirl.create(:user)

      login_as(user)
      get new_user_session_path
      expect(controller.current_user).to eq(user)

      logout(:user)
      get new_user_session_path
      expect(controller.current_user).to be_nil
    end
  end
end

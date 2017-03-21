require 'rails_helper'

RSpec.describe "HomePages", type: :request do
  describe "Content home page" do
    it "should have the content 'Welcome..'" do
      visit '/'
      expect(page).to have_content('Welcome to the Messenger App')
    end
  end
end

require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  context "GET #index" do
    context "when signed in" do
      should "return :success" do
        sign_in users(:one)

        get root_path

        assert_response :success
      end
    end

    context "when signed out" do
      should "redirect to users/sign_in" do
        get root_path

        assert_redirected_to new_user_session_path
      end
    end
  end
end

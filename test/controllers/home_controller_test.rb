require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get csvsave" do
    get :csvsave
    assert_response :success
  end

end

require 'test_helper'

class VacationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get vacations_new_url
    assert_response :success
  end

end

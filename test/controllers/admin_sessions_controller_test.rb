require "test_helper"

class AdminSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_path # 修正
    assert_response :success
  end

  test "should create admin session" do
    post admin_login_path, params: { email: "test@example.com", password: "password" }
    assert_response :redirect # リダイレクトを期待
    follow_redirect!
    assert_redirected_to admin_dashboard_index_path # ダッシュボードへのリダイレクトを確認
  end

  test "should destroy admin session" do
    delete admin_logout_path # 修正
    assert_response :redirect
    follow_redirect!
    assert_redirected_to login_path # ログアウト後のリダイレクト先を確認
    assert_response :success
  end
end

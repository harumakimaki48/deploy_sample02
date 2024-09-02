require "test_helper"

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_admin_path
    assert_response :success
  end

  test "should create admin" do
    post admins_path, params: { admin: { email: "test@example.com", crypted_password: "password", salt: "salt" } }

    # リダイレクト先のURLを修正
    assert_response :redirect
    follow_redirect!

    # 期待するリダイレクト先を確認 (例: 管理者のダッシュボードページにリダイレクトされること)
    assert_redirected_to admin_dashboard_index_path

    # リダイレクト先のページが表示されていることを確認
    assert_response :success
  end
end

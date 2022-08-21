require 'test_helper'

class KptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kpt = kpts(:one)
  end

  test "should get index" do
    get kpts_url
    assert_response :success
  end

  test "should get new" do
    get new_kpt_url
    assert_response :success
  end

  test "should create kpt" do
    assert_difference('Kpt.count') do
      post kpts_url, params: { kpt: { favorite: @kpt.favorite, keep_content: @kpt.keep_content, keep_status: @kpt.keep_status, problem_content: @kpt.problem_content, problem_status: @kpt.problem_status, try_content: @kpt.try_content, try_status: @kpt.try_status } }
    end

    assert_redirected_to kpt_url(Kpt.last)
  end

  test "should show kpt" do
    get kpt_url(@kpt)
    assert_response :success
  end

  test "should get edit" do
    get edit_kpt_url(@kpt)
    assert_response :success
  end

  test "should update kpt" do
    patch kpt_url(@kpt), params: { kpt: { favorite: @kpt.favorite, keep_content: @kpt.keep_content, keep_status: @kpt.keep_status, problem_content: @kpt.problem_content, problem_status: @kpt.problem_status, try_content: @kpt.try_content, try_status: @kpt.try_status } }
    assert_redirected_to kpt_url(@kpt)
  end

  test "should destroy kpt" do
    assert_difference('Kpt.count', -1) do
      delete kpt_url(@kpt)
    end

    assert_redirected_to kpts_url
  end
end

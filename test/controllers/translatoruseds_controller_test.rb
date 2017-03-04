require 'test_helper'

class TranslatorusedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @translatorused = translatoruseds(:one)
  end

  test "should get index" do
    get translatoruseds_url
    assert_response :success
  end

  test "should get new" do
    get new_translatorused_url
    assert_response :success
  end

  test "should create translatorused" do
    assert_difference('Translatorused.count') do
      post translatoruseds_url, params: { translatorused: { code: @translatorused.code, text: @translatorused.text } }
    end

    assert_redirected_to translatorused_url(Translatorused.last)
  end

  test "should show translatorused" do
    get translatorused_url(@translatorused)
    assert_response :success
  end

  test "should get edit" do
    get edit_translatorused_url(@translatorused)
    assert_response :success
  end

  test "should update translatorused" do
    patch translatorused_url(@translatorused), params: { translatorused: { code: @translatorused.code, text: @translatorused.text } }
    assert_redirected_to translatorused_url(@translatorused)
  end

  test "should destroy translatorused" do
    assert_difference('Translatorused.count', -1) do
      delete translatorused_url(@translatorused)
    end

    assert_redirected_to translatoruseds_url
  end
end

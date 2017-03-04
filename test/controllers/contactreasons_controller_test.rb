require 'test_helper'

class ContactreasonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contactreason = contactreasons(:one)
  end

  test "should get index" do
    get contactreasons_url
    assert_response :success
  end

  test "should get new" do
    get new_contactreason_url
    assert_response :success
  end

  test "should create contactreason" do
    assert_difference('Contactreason.count') do
      post contactreasons_url, params: { contactreason: { code: @contactreason.code, text: @contactreason.text } }
    end

    assert_redirected_to contactreason_url(Contactreason.last)
  end

  test "should show contactreason" do
    get contactreason_url(@contactreason)
    assert_response :success
  end

  test "should get edit" do
    get edit_contactreason_url(@contactreason)
    assert_response :success
  end

  test "should update contactreason" do
    patch contactreason_url(@contactreason), params: { contactreason: { code: @contactreason.code, text: @contactreason.text } }
    assert_redirected_to contactreason_url(@contactreason)
  end

  test "should destroy contactreason" do
    assert_difference('Contactreason.count', -1) do
      delete contactreason_url(@contactreason)
    end

    assert_redirected_to contactreasons_url
  end
end

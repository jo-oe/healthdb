require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_url
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post contacts_url, params: { contact: { client_id: @contact.client_id, comment: @contact.comment, contactdate: @contact.contactdate, contactreason_id: @contact.contactreason_id, contactreasonfreetext: @contact.contactreasonfreetext, counselledperson_id: @contact.counselledperson_id, counsellor_id: @contact.counsellor_id, failedinsurance_id: @contact.failedinsurance_id, has_healthproblem: @contact.has_healthproblem, has_housingproblem: @contact.has_housingproblem, has_insuranceproblem: @contact.has_insuranceproblem, has_paymentproblem: @contact.has_paymentproblem, has_psychosocialproblem: @contact.has_psychosocialproblem, has_workproblem: @contact.has_workproblem, healthproblem_id: @contact.healthproblem_id, insuranceproblem_id: @contact.insuranceproblem_id, insurancestatus_id: @contact.insurancestatus_id, referral_id: @contact.referral_id, referralauthority_id: @contact.referralauthority_id, referralcaritas_id: @contact.referralcaritas_id, referraldiakonie_id: @contact.referraldiakonie_id, referralmedical_id: @contact.referralmedical_id, referralothercounselling_id: @contact.referralothercounselling_id, successfulinsurance_id: @contact.successfulinsurance_id, translatorused_id: @contact.translatorused_id } }
    end

    assert_redirected_to contact_url(Contact.last)
  end

  test "should show contact" do
    get contact_url(@contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_url(@contact)
    assert_response :success
  end

  test "should update contact" do
    patch contact_url(@contact), params: { contact: { client_id: @contact.client_id, comment: @contact.comment, contactdate: @contact.contactdate, contactreason_id: @contact.contactreason_id, contactreasonfreetext: @contact.contactreasonfreetext, counselledperson_id: @contact.counselledperson_id, counsellor_id: @contact.counsellor_id, failedinsurance_id: @contact.failedinsurance_id, has_healthproblem: @contact.has_healthproblem, has_housingproblem: @contact.has_housingproblem, has_insuranceproblem: @contact.has_insuranceproblem, has_paymentproblem: @contact.has_paymentproblem, has_psychosocialproblem: @contact.has_psychosocialproblem, has_workproblem: @contact.has_workproblem, healthproblem_id: @contact.healthproblem_id, insuranceproblem_id: @contact.insuranceproblem_id, insurancestatus_id: @contact.insurancestatus_id, referral_id: @contact.referral_id, referralauthority_id: @contact.referralauthority_id, referralcaritas_id: @contact.referralcaritas_id, referraldiakonie_id: @contact.referraldiakonie_id, referralmedical_id: @contact.referralmedical_id, referralothercounselling_id: @contact.referralothercounselling_id, successfulinsurance_id: @contact.successfulinsurance_id, translatorused_id: @contact.translatorused_id } }
    assert_redirected_to contact_url(@contact)
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete contact_url(@contact)
    end

    assert_redirected_to contacts_url
  end
end

require 'test_helper'

class AppointmentDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appointment_document = appointment_documents(:one)
  end

  test "should get index" do
    get appointment_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_appointment_document_url
    assert_response :success
  end

  test "should create appointment_document" do
    assert_difference('AppointmentDocument.count') do
      post appointment_documents_url, params: { appointment_document: { name: @appointment_document.name } }
    end

    assert_redirected_to appointment_document_url(AppointmentDocument.last)
  end

  test "should show appointment_document" do
    get appointment_document_url(@appointment_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_appointment_document_url(@appointment_document)
    assert_response :success
  end

  test "should update appointment_document" do
    patch appointment_document_url(@appointment_document), params: { appointment_document: { name: @appointment_document.name } }
    assert_redirected_to appointment_document_url(@appointment_document)
  end

  test "should destroy appointment_document" do
    assert_difference('AppointmentDocument.count', -1) do
      delete appointment_document_url(@appointment_document)
    end

    assert_redirected_to appointment_documents_url
  end
end

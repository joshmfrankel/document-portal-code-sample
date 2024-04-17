require "test_helper"

class Public::DocumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    document = documents(:teacher_document_1)

    get public_document_url(document.uuid)

    assert_response :success
  end
end

require "test_helper"
class DocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:teacher)
    @document = documents(:teacher_document_1)
  end

  context "GET #index" do
    should "respond with :success" do
      get documents_url

      assert_response :success
    end
  end

  context "GET #new" do
    should "respond with :success" do
      get new_document_url

      assert_response :success
    end
  end

  context "POST #create" do
    should "creates new record and redirects to it" do
      assert_difference("Document.count") do
        post documents_url, params: { document: { name: @document.name } }
      end

      assert_redirected_to document_url(Document.last)
    end
  end

  context "GET #show" do
    should "respond with :success" do
      get document_url(@document)

      assert_response :success
    end
  end

  context "GET #edit" do
    should "respond with :success" do
      get edit_document_url(@document)

      assert_response :success
    end
  end

  context "PATCH #update" do
    should "update record and redirect to it" do
      patch document_url(@document), params: { document: { name: @document.name } }

      assert_redirected_to document_url(@document)
    end
  end

  context "DELETE #destroy" do
    should "destroy record and redirect to #index" do
      assert_difference("Document.count", -1) do
        delete document_url(@document)
      end

      assert_redirected_to documents_url
    end
  end
end

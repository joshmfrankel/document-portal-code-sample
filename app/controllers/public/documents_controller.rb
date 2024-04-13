class Public::DocumentsController < Public::ApplicationController
  def show
    @document = Document.find_by(uuid: params[:id])
  end
end

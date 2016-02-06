class DocumentsController < ApplicationController
  before_action :require_login

  def index
    @documents = current_user.documents
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.create(document_params.merge(user: current_user))
    # TODO: Flash success/failure?
    redirect_to library_path
  end

  def show
  end

  private

  def document_params
    params.require(:document).permit(:name, :description, :document)
  end
end

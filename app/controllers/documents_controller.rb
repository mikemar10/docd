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
    begin
      @document = Document.find(params[:id])
      unless @document.public || @document.user == current_user
        redirect_to library_path
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to library_path
      # TODO: should 404 here instead
    end
  end

  def edit
    @document = Document.find(params[:id])
  end

  def update
    redirect_to current_user.documents.find(params[:id]).tap { |document|
      document.update!(document_params)
    }
  end

  def destroy
    current_user.documents.find(params[:id]).tap { |document|
      document.destroy!
    }
    redirect_to library_path
    # TODO: Flash success?
  end

  private

  def document_params
    params.require(:document).permit(:name, :description, :public, :document, :tag_list)
  end
end

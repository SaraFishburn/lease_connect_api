class DocumentsController < ApplicationController
  def index
    render json: House.find(params[:house_id]).documents.as_json
  end

  def create
    Document.create(**document_params, house: House.find(params[:house_id]))
  end

  private

  def document_params
    params.permit(:title, :document_url)
  end
end

class DocumentsController < ApplicationController

  # method to provide all houses to property managers and admin and the current users house to a tenant
  def index
    if current_user.role_name == 'tenant'
      render json: current_user.house.documents.as_json
    else
      render json: House.find(params[:house_id]).documents.as_json
    end
  end

  # method to create a document record for a house in the database
  def create
    # only property managers and admin should be able to perform this action
    authorized('property manager', 'admin')
    Document.create(**document_params, house: House.find(params[:house_id]))
  end

  private

  def document_params
    params.permit(:title, :document_url)
  end
end

class DocumentsController < ApplicationController

  def destroy
    @document = Document.find(params[:id])
    @project = @document.project
    if authorize_action_for @project
      @document.delete
      redirect_to project_path(@project), notice: "Document deleted"
    else
      redirect_to project_path(@project), notice: "You cannot delete this document"
    end
  end

end
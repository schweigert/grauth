class NotesController < ApplicationController
  def create
    current_user.notes.create!(permited_params)
    redirect_to(root_path)
  end

  private

  def permited_params
    params.require(:note).permit(:title, :body)
  end
end

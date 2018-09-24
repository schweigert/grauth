class HomeController < ApplicationController
  def index
    @user = current_user
    @notes = @user.notes
    @note = current_user.notes.build
  end
end

class Contents::SearchesController < ApplicationController

  def index
    @content = Content.new
    @contents = Content.search(params[:content][:keyword], current_user.id)
  end

end

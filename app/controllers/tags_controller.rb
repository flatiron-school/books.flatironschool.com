class TagsController < ApplicationController
  def create
    if Tag.find_by(label: params[:tag][:label])
      @message = "We already have that one"
    else
      @tag = Tag.create(set_params)
      @message = "created!"
    end
    respond_to do |f|
      f.js
    end
  end

  private
  def set_params
    params.require(:tag).permit(:label)
  end
end

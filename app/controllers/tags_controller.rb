class TagsController < ApplicationController
  def create
    found = Tag.find_by(label: params[:tag][:label])
    if found
      @message = "#{found.label} tag already exists"
    else
      @tag = Tag.create(set_params)
      @message = "#{@tag.label} tag created"
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

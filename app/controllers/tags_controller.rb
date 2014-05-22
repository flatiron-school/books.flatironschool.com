class TagsController < ApplicationController
  def create
    found = Tag.find_by(label: params[:tag][:label].downcase)
    if found
      @message = "#{found.label} tag already exists"
    else
      lowercase_label = set_params["label"].downcase
      @tag = Tag.create(:label => lowercase_label)
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

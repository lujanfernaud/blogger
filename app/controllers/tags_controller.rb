class TagsController < ApplicationController
  before_filter :require_login, only: [:destroy]

  def index
    @tags  = Tag.all
    @title = "Tags"
  end

  def show
    @tag = Tag.find(params[:id])
    @title = "##{@tag.name.capitalize_all_words}"
    # capitalize_all_words comes from /config/initializers/string.rb
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    flash.notice = "Tag '#{@tag.name}' deleted."

    redirect_to tags_path
  end
end

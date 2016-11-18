class TagsController < ApplicationController
  before_filter :require_login, only: [:destroy]

  def index
    @tags  = Tag.all
    @title = "Tags"
  end

  def show
    @tag = Tag.find(params[:id])
    @title = "##{@tag.name}"
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    flash.notice = "Tag '#{@tag.name}' deleted."

    redirect_to tags_path
  end
end

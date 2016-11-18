module ArticlesHelper

  def article_params
    params.require(:article).permit(:title, :body, :tag_list, :image)
  end

  def is_owner?
    @article.author == current_user
  end

  def show_image_if_exists
    return unless @article.image.exists?
    "style\=\"background\: \#001D40 url\(\'#{@article.image.url}\'\) center center no-repeat\;
             background-size\: cover\;\"".html_safe
  end
end

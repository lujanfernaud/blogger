module ArticlesHelper

  def article_params
    params.require(:article).permit(:title, :body, :tag_list, :image)
  end

  def is_owner?
    @article.author == current_user
  end
end

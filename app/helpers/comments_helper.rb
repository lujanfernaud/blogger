module CommentsHelper
  def comment_number(comment)
    article_comments_array = @article.comments.sort
    # Send article comments to a hash, with the index as a value.
    article_comments_hash = Hash[article_comments_array.map.with_index(1).to_a]
    article_comments_hash[comment]
  end
end

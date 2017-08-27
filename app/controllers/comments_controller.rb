class CommentsController < ApplicationController
  include CommentsHelper

  before_filter :require_login, except: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]

    if @comment.save
      redirect_to_article_with("#comment-#{comment_number(@comment)}")
    else
      flash[:danger] = "The information is not correct. " \
                       "Did you answer the question correctly?"

      redirect_to_article_with("#post-a-comment")
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    comment_number = comment_number(@comment)
    @comment.destroy

    redirect_to_article_with("#comment-#{comment_number - 1}")
  end

  private

  def comment_params
    params.require(:comment).permit(:author_name, :body,
                                    :humanizer_answer, :humanizer_question_id)
  end

  def redirect_to_article_with(css_id)
    redirect_to article_path(@comment.article) + css_id
  end
end
